package com.proyecto.ligacut.controlador;

import com.proyecto.ligacut.dto.PosicionDTO;
import com.proyecto.ligacut.servicio.ServicioTabla;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api")
@CrossOrigin(origins = "http://localhost:4200")
public class TablaController {
    private final ServicioTabla servicioTabla;

    public TablaController(ServicioTabla servicioTabla) {
        this.servicioTabla = servicioTabla;
    }
    @GetMapping("/tabla")
    public List<PosicionDTO> obtenerTabla() {
        return servicioTabla.obtenerTabla();
    }
}
