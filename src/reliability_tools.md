# Herramientas de Confiabilidad

## Diagramas de blocos de confiabilidad
> Los diagramas de blocos de confiabilidad (reliability block diagram, o RBD) es un método para diagramar e identificar como la confiabilidad de componentes (o subsistemas) *R(t)*, contribuyen para el éxito o fracaso de una redundancia. Es decir, es un método que puede ser utilizado para diseñar y optimizar componentes y seleccionar redundancias, visando bajar los failure rates.

Un RBD es representado en una serie de blocos conectados (en série, en paralelo, o su combinación), indicando componentes redundantes, indicando el tipo de redundancia y su respectivo failure rate.

Al analizarse el diagrama, se indican componentes que fallaron y los que no fallaron. Si es posible encontrar una ruta o camino entre el inicio y el fin de proceso con componentes que no fallaron, se puede suponer que el proceso se puede completar.

Cada RBD debe incluir afirmaciones o sentencias listando todas las relaciones entre los componentes, es decir que condiciones llevarón a tomar un componente u otro en la ejecución del proceso.

Links:
* [Université Angers](https://moodle.univ-angers.fr/pluginfile.php/2071725/mod_resource/content/1/Reliability%20Engineering%20-%20ISMP%20-%20Chap%203%20-%20RBD.pdf)
* [Wikipedia](https://en.wikipedia.org/wiki/Reliability_block_diagram)
* [HPReliability](https://hpreliability.com/understanding-reliability-block-diagrams/)
* [Sydney Water](https://www.sydneywater.com.au/web/groups/publicwebcontent/documents/document/zgrf/mdq2/~edisp/dd_046415.pdf)

## Failure Reporting, Analysis, and Corrective Action System (FRACAS)
> FRACAS es un sistema o proceso definido para el reporte, clasificación y análisis de fallos, bien como la planeación de acciones correctivas de dichos fallos. Es parte del proceso guardar el historial de los análisis y acciones tomadas.

Llevar a cabo dicho proceso supone automatizar el análisis de los logs de los procesos de data (logs), commits, pull requests y tickets.

La implementación de proceso es cíclica y se da por (FRACAS Kaizen Loop adaptado):
* **Failure Mode Analysis**: analysis de los modos de fallos.
* **Failure Codes Creation**: creación de códigos de fallos, o la metodología para clasificarlos.
* **Work Order History Analysis**: análisis del historial de tickets enviados al equipo de data.
* **Root Cause Analysis**: análisis de las causas raíces.
* **Strategy Adjustment**: ajuste de estratégia.

Links:
* [Wikipedia](https://en.wikipedia.org/wiki/Failure_reporting,_analysis,_and_corrective_action_system)
* [Reliability Web](https://reliabilityweb.com/articles/entry/whats_the_fracas)
* [IEEE Best Practices](https://ieeexplore.ieee.org/abstract/document/1285523)

## Spare Parts Stocking Strategy
> Con suerte siempre existirán disponibles fuentes de datos limpias, con complejas transformaciones y limpiezas, que ahorran tiempo y procesamiento, y que pueden ser usadas en multiples etapas de multiples procesos, sin embargo las mismas pueden temporalmente estar no disponibles o fallar. Una vez identificados tales fuentes, y constatado que son críticas a un sistema o proceso, es prudente tener tareas mínimas de limpieza y transformaciones que trabajen sobre los datos crudos o fuentes de la fuente, que quizas no resultará en datos finales con los mismos niveles de detalles, pero que serán lo suficiente buenos.

Tales tareas no son diseñadas para hacer parte del flujo normal de los procesos, pero son "piezas de recambio", disponibles para cuando los tiempos de mantenimiento son demasiado largos. El empleo de dichas tareas deben ser por el mínimo de tiempo posible, mientras el equipo tiene tiempo de resolver los fallos en la tarea original, o diseñar su reemplazo.

Links:
* [ReliabilityWeb](https://reliabilityweb.com/articles/entry/how_to_develop_a_spare_parts_stocking_strategy)

## Availability Controls
> Fallos de disponibilidad pueden ocurrir por un sin numero de razones (desde hardware hasta bugs), y algunos sistemas o procesos tienen suficiente relevancia para que controles de disponibilidad (availability controls) sean implementados, para asegurar que determinados servicios o data sigan disponibles cuando ocurra dichos fallos.

Los controles de disponibilidad van desde el uso de backups periódicos de la data, snaps, timetravel, procesos redundantes, sistemas de respaldo en servidores locales o cloud, etc.

Links:
* [WhiteHatSec](https://www.whitehatsec.com/glossary/content/availability-controls)
* [Law Insider](https://www.lawinsider.com/clause/availability-control)
* [Control Global](https://www.controlglobal.com/assets/14WPpdf/140324-ISA-ControlSystemsHighAvailability.pdf)

## Acciones Correctivas
> Parte del CAPA (Corrective Action and Preventive Action Process), las acciones correctivas (CAP - Corrective Action Process) consisten en la detección de fallos, la determinación de sus causas raíces, las acciones de corrección, y la toma de medidas de prevención para que el mismo fallo vuelva a ocurrir por los mismos motivos. La definición completa se encuentra en la ISO 9001.

Diversas herramientas y técnicas son utilizadas en diversas industrias para su aplicación, dentre ellas, PDCA (Plan, Do, Check, Act), DMAIC (Define. Measure, Analyse, Improve, Control), 8D, etc. De manera general cualquier herramienta, técnica o metodologia, es sumarizada en la ISO 9001, en siete "pasos":

1. Definir el problema. Consiste en definir que el problema sea real, identificar Quien, Qué, Cuando, Dónde y Por qué. En el mundo de la ingeniería de datos, ese paso debe ser, en lo posíble, automático, y el fallo debe ser detectado desde sensores.
2. Definir el escopo. Consiste en mensurar el problema a se resolver, conociendo su frecuencia, a que procesos o tareas, y stakeholders afecta. Para los procesos de data, muchos de los detalles de escopo ya deberían ser información conocida, desde el diseño de los procesos y tareas, ya la frecuencia puede ser levantada desde los procesos de observability y FRACAS.
3. Acciones de confinamiento o contención. Son medidas puntuales y adoptadas por el mínimo de tiempo posible, mientras se trabaja en la solución definitiva del fallo. De antemano, tales medidas ya deberían estar diseñadas, para cada tarea o sub-tarea. La selección de medidas debería estar automatizada, de no serlo, se deben implementar de inmediato.
4. Identificación de causas raíz. Diagnosis clara, precisa y completa del fallo. Su documentación hace parte del FRACAS.
5. Planeación de acciones correctivas. Consiste en la planeación de acciones de corrección basadas especificamente en la causa raíz.
6. Implementación de acciones correctivas. Consiste en la implementación final de las acciones correctivas en el proceso, que deben automaticamente estar disponibles cuando fallos similares se presenten.
7. Acompañamento de los resultados (Follow up). Documentación, comunicación, FRACAS completos.

## Antifragilidad
> Inspirado en el libro *Antifragile: Things That Gain from Disorder* de Nissim Nicholas Taleb, la antifragilidad difere de los conceptos de resiliencia o robustez, dónde los sistemas buscan mantener su nivel de confiabilidad, sino que desde su diseño, los sistemas aumentar su confiabilidad con respecto a los inputs del sistema.

La antifragilidad propone un cambio de diseño de los sistemas (en el escopo de este libro, procesos), los cuales comumente son diseñados para ser frágiles, en el sentido de que si el mismo opera fuera de sus requerimientos, lo mismo fallará. La antifragilidad propone lo contrário, diseñar sistemas que se vuelven mejores cuando expuestos a cargas fuera de los requerimientos. En ese sentido, los sistemas no son diseñados para responder solamente a lo esperado o anticipado, sino que interactúan con su entorno en tiempo real y se adaptan a ello.

* Self-healing
* Real time sensoring, monitoring
* Live FRACAS
* System Health Management
* Automatic Repair

Links:
* [NASA](https://ntrs.nasa.gov/api/citations/20140010075/downloads/20140010075.pdf)
* [Refuses](https://refuses.github.io/preprints/antifragile.pdf)

## Bulkhead Pattern
> En el mundo náutico encontramos los mamparos, placas de madera que encontramos en los barcos, que buscan que el barco no naufrague cuando se tiene comprometida una porción del casco. Para los sistemas el Bulkhead Pattern adapta exactamente esa idea, de que un fallo en una porción del sistema no comprometa el sistema en su totalidad.

Este design pattern es aplicado comumente en el desarrollo de software, consiste en no sobrecargar un servicio con más llamadas de las que puede soportar en un determinado tiempo, un ejemplo de eso es Hystrix, de Netflix.

Links:
* [Netflix](https://github.com/Netflix/Hystrix/wiki/How-it-Works)