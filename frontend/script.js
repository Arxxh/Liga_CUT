const API_URL= "http://127.0.0.1:8000/jugadores";

// Cargar Jugadores

async function cargarJugadores() {
    const res = await fetch(API_URL);
    const data = await res.json();


    const tabla = document.getElementById("tablaJugadores");
    tabla.innerHTML = "";
    data.forEach(j => {
        tabla.innerHTML += `
            <tr class="border-b">
                <td class="p-2">${j.id}</td>
                <td class="p-2">${j.nombre}</td>
                <td class="p-2">${j.posicion}</td>
                <td class="p-2">${j.dorsal}</td>
            </tr>
        `;
    });
}


document.getElementById("formJugador").addEventListener("submit", async (e) =>{
    e.preventDefault();

    const jugador ={
        id: parseInt(document.getElementById("id").value),
        nombre: document.getElementById("nombre").value,
        posicion: document.getElementById("posicion").value,
        dorsal: parseInt(document.getElementById("dorsal").value),
        goles: 0
    };

    await fetch(API_URL, {
        method: "POST",
        headers: {"Content-Type": "application/json" },
        body: JSON.stringify(jugador)
    });

    e.target.reset();
    cargarJugadores();

});

cargarJugadores();