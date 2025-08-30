package com.proyecto.Liga_CUT.dto;

public class PosicionDTO {
    private Long equipoId;
    private String nombre;
    private Integer partidosJugados;
    private Integer ganados;
    private Integer empatados;
    private Integer perdidos;
    private Integer golesFavor;
    private Integer golesContra;
    private Integer diferenciaGoles;
    private Integer puntos;
    private Integer posicion;

    // Constructores 

    public PosicionDTO() {}

    public PosicionDTO(Long equipoId, String nombre, Integer partidosJugados, Integer ganados,
                      Integer empatados, Integer perdidos, Integer golesFavor, Integer golesContra,
                      Integer diferenciaGoles, Integer puntos) {
        this.equipoId = equipoId;
        this.nombre = nombre;
        this.partidosJugados = partidosJugados;
        this.ganados = ganados;
        this.empatados = empatados;
        this.perdidos = perdidos;
        this.golesFavor = golesFavor;
        this.golesContra = golesContra;
        this.diferenciaGoles = diferenciaGoles;
        this.puntos = puntos;
    }
    
    // Getters y Setters
    public Long getEquipoId() { return equipoId; }
    public void setEquipoId(Long equipoId) { this.equipoId = equipoId; }
    public String getNombre() { return nombre; }
    public void setNombre(String nombre) { this.nombre = nombre; }
    public Integer getPartidosJugados() { return partidosJugados; }
    public void setPartidosJugados(Integer partidosJugados) { this.partidosJugados = partidosJugados; }
    public Integer getGanados() { return ganados; }
    public void setGanados(Integer ganados) { this.ganados = ganados; }
    public Integer getEmpatados() { return empatados; }
    public void setEmpatados(Integer empatados) { this.empatados = empatados; }
    public Integer getPerdidos() { return perdidos; }
    public void setPerdidos(Integer perdidos) { this.perdidos = perdidos; }
    public Integer getGolesFavor() { return golesFavor; }
    public void setGolesFavor(Integer golesFavor) { this.golesFavor = golesFavor; }
    public Integer getGolesContra() { return golesContra; }
    public void setGolesContra(Integer golesContra) { this.golesContra = golesContra; }
    public Integer getDiferenciaGoles() { return diferenciaGoles; }
    public void setDiferenciaGoles(Integer diferenciaGoles) { this.diferenciaGoles = diferenciaGoles; }
    public Integer getPuntos() { return puntos; }
    public void setPuntos(Integer puntos) { this.puntos = puntos; }
    public Integer getPosicion() { return posicion; }
    public void setPosicion(Integer posicion) { this.posicion = posicion; }
}
