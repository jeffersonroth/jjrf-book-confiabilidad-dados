# Tolerancia de Fallos
> Debido a las limitaciones en las prevenciones de fallos, una vez que la data y los procesos cambian con frecuencia, es necesario recurrir a la tolerancia de fallos.

Existen diferentes niveles de tolerancia a fallos:
* **Tolerancia total**: no hay manejo de condiciones adversas o no deseadas, el proceso no se adapta a las validaciones y variables de entorno u otras informaciones externas para la ejecución de los tasks.
* **Degradación controlada** (o caída suave): notificaciones serán disparadas en la presencia de fallos, y siendo el suficiente importantes para interrumpir el flujo de tareas (thresholds, inexistencia o indisponibilidad de la data), los operadores de rama seleccionarán los tasks subsiguientes.
* **Fallo seguro**: los fallos detectados son suficientes para detectar que el proceso no debe ocurrir, un operador de cortocircuito cancela la ejecución de los subsiguientes tasks, los responsables son notificados, y caso no exista un proceso automático para lidiar con el problema, el equipo de data puede tomar acciones como volver a ejecutar los procesos que generan los inputs necesarios, o escalar el caso.

El diseño de los procesos tolerantes a fallos supone:
* Los algoritmos de las tareas se han diseñado correctamente.
* Se conocen todos los posibles modos de fallos de los componentes.
* Se han tenido en cuenta todas las posibles interacciones entre el proceso y su entorno.

## Redundancia
> Todas las técnicas utilizadas para conseguir tolerancia a fallos se basan en añadir elementos externos al sistema para que detecte y se recupere de fallos. Estos elementos son redundantes en el sentido de que no son necesarios para el normal funcionamiento del sistema, a esto llamamos **redundancia protectora**. El objetivo de la tolerancia es minimizar la redundancia, maximizando la fiabilidad, siempre bajo las restricciones de complejidad y tamaño del sistema. **Se debe tener cuidado al diseñar los sistemas tolerantes a fallos, ya que los componentes incrementan la complejidad y mantenimiento de todo el sistema, lo que puede en sí, conducir a sistemas menos fiables**.

Clasificamos la redundancia en los sistemas en estáticas y dinámicas. La **redundancia estática**, o enmascaramiento, consiste en que los componentes redundantes son utilizados para ocultar los efectos de los fallos. La **redundancia dinámica** es la redundancia aportada dentro de un componente que hace que el mismo indique, implícita o explícitamente, que la salida es errónea; la recuperación debe ser proporcionada por otro componente. Esta técnica de tolerancia a fallos tiene cuatro fases:
1. **Detección de errores**: no se utilizará ningún esquema de tolerancia a fallos hasta que se haya detectado un error.
2. **Confinamiento y valoración de daños**: cuando se detecte un error, debe estimarse la extensión del sistema que ha sido corrompida (diagnóstico de error) y su escopo.
3. **Recuperación del error**: este es uno de los aspectos más importantes de la tolerancia a fallos. Las técnicas de recuperación de errores deberían dirigir al sistema corrupto a un estado a partir del cual pueda continuar con su normal funcionamiento (quizás con una degradación funcional).
4. **Tratamiento del fallo y continuación del servicio**: un error es un síntoma de un fallo; aunque el daño pudiera haber sido reparado, el fallo continúa existiendo, y por lo tanto el error puede volver a darse a menos que se realice algún tipo de mantenimiento.

### 1. Detección de errores
> La efectividad de un sistema tolerante a fallos depende de la **efectividad de detección de errores**.

La detección de errores se clasifican en:
* **Detecciones en el entorno**. Los errores se detectan en el entorno en el cual se ejecutan el programa. Son manejados por las excepciones (exceptions).
* **Detección en la aplicación**. Los errores se detectan en la misma aplicación.
  * **Comprobaciones inversas**. Aplicadas en componentes de relación isomórfica (uno a uno) entre la entrada y la salida. En este método, se toma la salida y se calcula la entrada, lo cual es comparado con el valor de entrada original. Para casos de números reales, es necesario adoptar técnicas de comparación inexactas.
  * **Comprobación de racionalidad**. Se basan en el conocimiento del diseño y de la construcción del sistema. Comprueban que el estado de los datos o el valor de un objeto es razonable basándose en su supuesto uso.

### 2. Confinamiento y valoración de los daños
> Siempre existirá una magnitud de tiempo, entre la ocurrencia de un defecto y la detección del error, siendo por lo tanto importante la valoración de cualquier daño que se haya podido producir en este intervalo de tiempo.

Aunque el tipo de error detectado podrá dar ideas sobre el daño a la rutina de tratamiento del error, podrían haber sido diseminadas informaciones erróneas por el sistema y su entorno. Así, la valoración de los daños estará directamente relacionada con las precauciones tomadas por el diseñador de este sistema para el confinamiento del daño (**construcción de cortafuegos**). El confinamiento del daño se refiere a la estructuración del sistema de modo que se minimicen los daños causados por un componente defectuoso.

Existen dos técnicas principales para estructurar los sistemas de modo que se facilite el confinamiento de daños: **descomposición modular** y **acciones atómicas**. Por descomposición modular entiéndase que los sistemas deben ser descompuestos en componentes, cada uno de los cuales se representa por uno o más módulos. La interacción de los componentes se produce a través de interfaces bien definidas, y los detalles internos de los módulos están ocultos y no son accesibles directamente desde el exterior. Esto hace más difícil que un error en un componente pase indiscriminadamente a otro.

La descomposición modular proporciona al sistema una estructura estática, ya las acciones atómicas proporcionan al mismo una estructura dinámica. Se dice que una acción es atómica si no existen interacciones entre la actividad y el sistema durante el transcurso de la acción. Estas acciones se utilizan para mover el sistema de un estado consistente a otro, y para restringir el flujo de información entre los componentes.

### 3. Recuperación de errores
> Una vez detectada la situación de error, y que sus posibles daños hayan sido valorados, se inician los procedimientos de recuperación de errores. Esta fase es probablemente la más importante dentro de las técnicas de tolerancia a fallos, la cual debe transformar un estado erróneo del sistema en otro desde el cual el sistema pueda continuar con su funcionamiento normal, quizás con una cierta degradación en el servicio.

Aquí citaré dos estrategias para la recuperación de errores: recuperación **hacia adelante**, y **hacia atrás**. La recuperación de errores hacia adelante intenta continuar desde el estado erróneo realizando correcciones selectivas en el estado del sistema, que incluye proteger cualquier aspecto del entorno controlado que pudiera ser puesto en riesgo o dañado por el fallo.

La recuperación hacia atrás se basa en restaurar el sistema a un estado seguro previo a aquél en el que se produjo el error, para luego ejecutar una sección alternativa de la tarea. Ésta tendrá la misma funcionalidad que la sección que produjo el defecto, pero utilizando un algoritmo distinto. Se espera que esta alternativa no produzca el mismo defecto que la versión anterior, así que dependerá del conocimiento del diseñador sobre los posibles modos de fallo de este componente.

El diseñador debe tener claro los niveles de degradación de un servicio, teniendo en cuenta los servicios y procesos que dependen de éste. La recuperación de errores hace parte de los procesos de acción correctiva y acciones preventivas (CAPA - Corrective Action and Preventive Action Process), el cual se trabajará en dos momentos: en ese mismo capitulo de tolerancia a fallos cuando se trabajen las acciones correctivas, y en el próximo capitulo, prevención de fallos, cuando se aborde el tema de acciones preventivas.

### 4. Tratamiento de los fallos y servicio continuado
> Un error es una manifestación de un defecto, y aunque la fase de recuperación del error puede haber llevado el sistema a un estado libre de error, el error se puede volver a producir. Por lo tanto, la fase final de la tolerancia de fallos es erradicar el fallo del sistema, de forma que se pueda continuar con el servicio normal.