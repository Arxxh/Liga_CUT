package com.proyecto.Liga_CUT.servicio;

import com.proyecto.Liga_CUT.dto.PosicionDTO;
import jakarta.persistence.EntityManager;
import jakarta.persistence.Query;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;

@Service
public class ServicioTabla {

    private final EntityManager em;

    public ServicioTabla(EntityManager em) {
        this.em = em;
    }

    @Transactional(readOnly = true)
    public List<PosicionDTO> obtenerTabla() {
        String sql = 
            "SELECT t.id_equipo, t.nombre, " +
            "COALESCE(SUM(s.pj),0) AS partidos_jugados, " +
            "COALESCE(SUM(s.g),0) AS ganados, " +
            "COALESCE(SUM(s.e),0) AS empatados, " +
            "COALESCE(SUM(s.p),0) AS perdidos, " +
            "COALESCE(SUM(s.gf),0) AS goles_favor, " +
            "COALESCE(SUM(s.ga),0) AS goles_contra, " +
            "(COALESCE(SUM(s.gf),0) - COALESCE(SUM(s.ga),0)) AS diferencia_goles, " +
            "COALESCE(SUM(s.pts),0) AS puntos " +
            "FROM ( " +
            "  SELECT p.id_equipo_local AS id_equipo, 1 AS pj, " +
            "    CASE WHEN p.goles_local > p.goles_visitante THEN 1 ELSE 0 END AS g, " +
            "    CASE WHEN p.goles_local = p.goles_visitante THEN 1 ELSE 0 END AS e, " +
            "    CASE WHEN p.goles_local < p.goles_visitante THEN 1 ELSE 0 END AS p, " +
            "    p.goles_local AS gf, p.goles_visitante AS ga, " +
            "    CASE WHEN p.goles_local > p.goles_visitante THEN 3 WHEN p.goles_local = p.goles_visitante THEN 1 ELSE 0 END AS pts " +
            "  FROM partido p WHERE p.estado = 'finalizado' " +
            "  UNION ALL " +
            "  SELECT p.id_equipo_visitante AS id_equipo, 1 AS pj, " +
            "    CASE WHEN p.goles_visitante > p.goles_local THEN 1 ELSE 0 END AS g, " +
            "    CASE WHEN p.goles_visitante = p.goles_local THEN 1 ELSE 0 END AS e, " +
            "    CASE WHEN p.goles_visitante < p.goles_local THEN 1 ELSE 0 END AS p, " +
            "    p.goles_visitante AS gf, p.goles_local AS ga, " +
            "    CASE WHEN p.goles_visitante > p.goles_local THEN 3 WHEN p.goles_visitante = p.goles_local THEN 1 ELSE 0 END AS pts " +
            "  FROM partido p WHERE p.estado = 'finalizado' " +
            ") s " +
            "RIGHT JOIN equipo t ON t.id_equipo = s.id_equipo " +
            "GROUP BY t.id_equipo, t.nombre";

        Query q = em.createNativeQuery(sql);
        @SuppressWarnings("unchecked")
        List<Object[]> rows = q.getResultList();

        List<PosicionDTO> lista = new ArrayList<>();
        for (Object[] r : rows) {
            // r: [id_equipo, nombre, partidos_jugados, ganados, empatados, perdidos, goles_favor, goles_contra, diferencia_goles, puntos]
            Long equipoId = r[0] == null ? null : ((Number) r[0]).longValue();
            String nombre = r[1] == null ? "" : r[1].toString();
            Integer pj = r[2] == null ? 0 : ((Number) r[2]).intValue();
            Integer g = r[3] == null ? 0 : ((Number) r[3]).intValue();
            Integer e = r[4] == null ? 0 : ((Number) r[4]).intValue();
            Integer p = r[5] == null ? 0 : ((Number) r[5]).intValue();
            Integer gf = r[6] == null ? 0 : ((Number) r[6]).intValue();
            Integer ga = r[7] == null ? 0 : ((Number) r[7]).intValue();
            Integer dg = r[8] == null ? (gf - ga) : ((Number) r[8]).intValue();
            Integer pts = r[9] == null ? 0 : ((Number) r[9]).intValue();

            PosicionDTO dto = new PosicionDTO(equipoId, nombre, pj, g, e, p, gf, ga, dg, pts);
            lista.add(dto);
        }

        // ordenar: puntos DESC, diferencia DESC, golesFavor DESC, nombre ASC
        lista.sort(Comparator.comparing(PosicionDTO::getPuntos).reversed()
                .thenComparing(PosicionDTO::getDiferenciaGoles, Comparator.nullsLast(Comparator.reverseOrder()))
                .thenComparing(PosicionDTO::getGolesFavor, Comparator.nullsLast(Comparator.reverseOrder()))
                .thenComparing(PosicionDTO::getNombre));

        // asignar posiciones (1..n)
        int pos = 1;
        for (PosicionDTO d : lista) {
            d.setPosicion(pos++);
        }

        return lista;
    }
}