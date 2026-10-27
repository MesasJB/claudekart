# Kart Web 🏁

Juego de karts 3D para el navegador (Three.js). **El código es original**; los modelos y la música los ponés vos.

## 1. Poné tus archivos

Este proyecto **no incluye** ningún asset de Nintendo ni música. Cada carpeta de `assets/` tiene un `LEEME.txt` que dice qué va ahí:

| Carpeta | Qué va | Zip / archivo |
|---|---|---|
| `assets/course/` | toda la pista | `Wii_U_-_Mario_Kart_8_-_Courses_-_Mario_Kart_Stadium.zip` |
| `assets/kart/` | kart de Mario (`.dae` + `Tex/`) | `3DS_-_Nintendogs___Cats_-_Toys_-_Mario_Kart.zip` (carpeta `Mario Kart`) |
| `assets/karts/peach/` | kart de Peach (`pk_kart.obj`…) | `DS___DSi_-_Nintendogs_-_Items_-_Mario_Kart_Toy__Peach_.zip` (carpeta `pk_kart`) |
| `assets/karts/bowser/` | kart de Bowser (`kk_kart.obj`…) | `DS___DSi_-_Nintendogs_-_Items_-_Mario_Kart_Toy__Bowser_.zip` (carpeta `kk_kart`) |
| `assets/items/itembox/` | caja de items (`ItemBox.dae`, `ItemBoxFont.dae` + .png) | `Wii_U_-_Mario_Kart_8_-_Items_-_Item_Box.zip` (carpeta `Item Box`) |
| `assets/items/mushroom/` | hongo (`ItemKinoko.dae` + .png) | `Wii_U_-_Mario_Kart_8_-_Items_-_Mushroom.zip` (carpeta `Mushroom`) |
| `assets/luigi/` | Luigi (`luigi.obj`, `luigi.mtl` + .png) | `Wii_U_-_Mario_Kart_8_-_Racers_-_Luigi.zip` (carpeta `Luigi`) |
| `assets/standardkart/` | kart de Luigi (`Standard Kart.obj`, textura verde `bodyk_std_lig_alb.png`, `Emblems/`) | `Wii_U_-_Mario_Kart_8_-_Karts_-_Standard_Kart.zip` (todo el contenido) |
| `assets/parachute/` | paracaídas (`parachute.obj`, `.mtl`, `Wing_Prc_Alb.png`) | `Wii_U_-_Mario_Kart_8_-_Gliders_-_Parachute.zip` (carpeta `Parachute`) |
| `assets/items/shell/` | caparazones (`ItemKoura.dae` + `ItemKoura_Alb.0.png` / `.1.png`) | `Wii_U_-_Mario_Kart_8_-_Items_-_Green___Red_Shell.zip` (carpeta `Green Red Shell`) |
| `assets/ui/` | `logo.png` (logo de Mario Kart 8) e `iconos.png` (hoja de íconos de personajes) | tus dos imágenes, renombradas |
| `assets/audio/` | tu música como `musica.mp3` | ver `assets/audio/LEEME_MUSICA.txt` |

Siempre se copia el **contenido** de la carpeta (no la carpeta entera). Si algo falta, el juego avisa en el menú y usa un reemplazo simple. Las rutas están en `js/config.js`.

## 2. Abrilo

El navegador no deja cargar archivos desde `file://`, así que hace falta un servidor local (y internet para bajar Three.js):

* **Windows:** doble clic en `start.bat` (necesita Python o Node.js).
* **Mac / Linux:** `./start.sh`
* A mano: `python -m http.server 8000` y abrí http://localhost:8000

Esperá a que cargue la pista (el `.obj` pesa 18 MB) y apretá **ENTER**.

## Controles

| Tecla | Acción |
|---|---|
| W / ↑ | Acelerar |
| S / ↓ | Frenar / marcha atrás |
| A D / ← → | Girar (en la pared, moverte hacia los costados) |
| Espacio | Saltito + derrape (al soltar sale un turbo) |
| Shift / E | Usar item |
| M | Silenciar (música y sonidos) |
| ← → (en el menú) | Elegir personaje |
| Enter | Correr / volver a elegir personaje |

También anda con joystick.

## Qué trae

* **Selector de personajes** (Mario, Luigi, Peach, Bowser) con el logo y los íconos de Mario Kart 8; la cámara te muestra el kart elegido. Flechas para elegir, Enter para correr. Los rivales son los otros personajes.
* 3 vueltas contra 7 rivales.
* Derrape con mini-turbos, paneles de turbo, saltos, choques entre karts.
* Items con modelos reales de Mario Kart 8: caja de items, hongo y caparazones verde (rebota) y rojo (teledirigido), que también giran en el cuadro de item. La banana sigue siendo un dibujo simple propio.
* Luigi: su modelo en posición de conducción (sentado, piernas al frente y manos adelante) en el kart verde.
* Animaciones: los conductores se inclinan hacia las curvas y miran hacia donde giran, rebotan al aterrizar y en los baches, se echan hacia atrás al acelerar o usar turbo y se sacuden cuando los golpean.
* Sombras en tiempo real de la pista y de los karts (la luz te sigue); cajas de items transparentes tipo vidrio.
* **Tramo de la pared:** la parte de la pista que se retuerce hasta quedar vertical (anti-gravedad) se maneja pegado a la superficie, con la cámara girando con vos; al final del tramo el kart abre el **paracaídas** (lo usan todos los personajes) y planea hasta la ruta de abajo.
* Música en bucle, minimapa, puestos en vivo y tabla de resultados.

## Cosas que podés tocar (`js/config.js`)

* `mapScale`: tamaño de la pista (2 = el doble de larga y ancha que el modelo original; 1 = original; probá 3 si la querés enorme).
* `shadows`, `shadowMapSize`, `shadowRange`: sombras en tiempo real (de la pista y de los personajes). Si va lento, ponelo en `false` o bajá `shadowMapSize` a 1024.
* `luigi` (`armOut`, `armDown`, `scale`, `y`, `z`): cómo se sienta Luigi y dónde pone los brazos.

* `kartLength`: tamaño de los karts (2.2 por defecto; achicalo o agrandalo a gusto).
* `camDist`, `camHeight`: distancia y altura de la cámara.
* `laps`, `aiCount`, `playerStartPlace`, `maxSpeed`, `turn`, `grip`, `driftGrip`…
* `music`, `musicVolume`.
* `kartYawOffset`: si algún kart aparece de costado o al revés, probá `Math.PI` o `Math.PI / 2`.
* `doubleSideAll: true`: si alguna parte de la pista se ve invisible.

## Cómo está armado

* `js/objparse.js`: lee .obj/.mtl (ignora la opacidad `d 0` del .mtl, que dejaría todo invisible).
* `js/collision.js`: rejilla de triángulos para la altura del suelo.
* `data/waypoints.json`: recorrido de la pista (IA, vueltas, puestos, límites). `data/wallpath.json`: camino 3D del tramo de la pared. Ambos están calculados con la geometría de *Mario Kart Stadium*; con otra pista hay que generarlos de nuevo.
* `tools/test_core.mjs`: prueba rápida por consola.

## Notas

* No se usan los mapas de luz precalculados (`bake_*.png`), por eso la iluminación es más simple que en el original.
* Los modelos y la música son de sus dueños: usalos solo para uso personal y no publiques el juego con ellos adentro.
