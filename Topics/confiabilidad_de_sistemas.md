# Confiabilidad de Sistemas
> La confiabilidad de un sistema es la propiedad del sistema que permite calificar, justificadamente, como fiable al servicio que proporciona.

## Impedimentos: Fallos, Errores y Defectos
> Los **fallos** son el resultado de problemas internos no esperados que el sistema manifiesta eventualmente en su comportamiento externo. Estos problemas se llaman **errores**, y sus causas mecánicas o algorítmicas se denominan **defectos**. Cuando el comportamiento de un sistema se desvía del especificado para él, se dice que es un fallo.

Los sistemas están compuestos de **componentes**, cada uno de los cuales se puede considerar como un sistema en sí mismo. Así, un fallo en un sistema puede inducir un defecto en otro, el cual puede acabar en un error y en un fallo potencial de este sistema. Esto puede continuar y producir un efecto en cualquier sistema relacionado, y así sucesivamente.

Un componente defectuoso de un sistema es un componente que producirá un error bajo un conjunto concreto de circunstancias durante la vida del sistema. Visto en términos de transición de estados, *un sistema puede ser considerado como un número de estados externos e internos*. 

Un estado externo no especificado en el comportamiento del sistema se considerará un fallo del sistema. El sistema en sí mismo consta de un número de componentes (cada uno con sus propios estados), contribuyendo todos ellos al comportamiento externo del sistema. La combinación de los estados de estos componentes se denomina estado interno del sistema. Un estado interno no especificado se considera un error, y el componente que produjo la transición de estados ilegal se dice que es defectuoso.

Definiré tres tipos de fallos:
* **Fallos transitorios**: comienza en un instante de tiempo concreto, se mantiene en el sistema durante algún periodo de tiempo, y luego desaparece. Ejemplos: 
Singular tiene problemas con su proceso ETL, haciendo que la data no esté disponible por un tiempo determinado.
* **Fallos permanentes**: comienzan en un instante determinado y permanecen en el sistema hasta que son reparados. Ejemplos: 
Una tabla cambia el nombre de una columna, y el problema permanece hasta que las columnas sean actualizadas en los queries que la consumen.
Las definiciones de tipo de usuario (HL, UHL, etc.) cambian, haciendo que los procesos fallen hasta que se adapten a las nuevas definiciones.
* **Fallos intermitentes**: son fallos transitorios que ocurren de vez en cuando. Ejemplos: 
El proceso de atribución de canales de media puede tardar más que el normal en algunas situaciones, afectando el proceso de atribución general.

### Modos de Fallos
Un sistema puede fallar de muchas maneras. Un diseñador puede diseñar el sistema suponiendo un número finito de modos de fallo, sin embargo el sistema puede fallar de manera diferente a lo esperado. Podemos clasificar los modos de fallos de los servicios que proporciona un sistema, los cuales:
* **Fallos de valor**: el valor asociado con el servicio es erróneo.
* **Fallo de tiempo**: el servicio se completa a destiempo.
* **Fallo arbitrario**: combinación de fallos de valor y tiempo.

Los modos de fallo de valor se denominan **domínio de valor**, y son clasificados en **error de límites**, y **valor erróneo**, dónde el valor se encuentra fuera del rango estipulado.

Los fallos en el dominio del tiempo pueden hacer que el servicio sea entregado:
* **Demasiado pronto** (adelantado): el servicio se entrega antes de lo requerido.
* **Demasiado tarde** (retrasado o error de prestaciones): el servicio se entrega después de lo requerido.
* **Infinitamente tarde** (fallo de omisión): el servicio nunca es entregado.
* **No esperado** (fallo de encargo o improvisación): el servicio es entregado sin ser esperado.

En general, podemos suponer los modos que un sistema puede fallar:
* **Fallo descontrolado**: un sistema que produce errores arbitrales, tanto en el dominio del valor como en el del tiempo (incluyendo errores de improvisación).
* **Fallo de retraso**: un sistema que produce servicios correctos en el dominio del valor, pero que sufre errores de retraso en el tiempo.
* **Fallo de silencio**: un sistema que produce servicios correctos tanto en el dominio del valor como en el del tiempo, hasta que falla. El único fallo posible es el de omisión, y cuando ocurre, todos los servicios siguientes también sufrirán fallos de omisión.
* **Fallo de parada**: un sistema que tiene todas las propiedades de un fallo silencioso, pero que permite que otros sistemas puedan detectar que ha entrado en el estado de fallo de silencio.
* **Fallo controlado**: un sistema que falla de una forma especificada y controlada.
* **Sin fallos**: un sistema que siempre produce los servicios correctos.

## Deficiencias
> Circunstancias que causan o son producto de la no **confiabilidad**.

## Atributos
> El modo y las medidas mediante las cuales se puede **estimar la calidad de un servicio confiable**.

### Confiabilidad
> Es la probabilidad *R(t)* de que el sistema **siga funcionando al final del proceso**. El tiempo *t* se mide en horas continuas de trabajo entre diagnósticos. La tasa constante de fallos &lambda; se mide en *fallos/h*. La vida útil de un componente del sistema es la región constante (escala logarítmica) de la curva entre vida del componente (Component Age) y su tasa de fallos (Failure Rate). La región de la gráfica antes del equilibrio es el Burn In Phase, y la región en donde la tasa de fallos empieza a crecer es el End of Life Phase. Así tenemos *R(t)=exp(-&lambda;t)*.

### Disponibilidad
> Es la medida de la **frecuencia de los periodos de servicio incorrecto**.

### Fiabilidad
> Continuidad de entrega del servicio. 

Es una medida (probabilidad) del **éxito con el que el sistema se ajusta a la especificación definitiva de su comportamiento**.

### Seguridad
> Es la ausencia de condiciones que pueden causar daños y propagación de **daños catastróficos** en producción.

Sin embargo, como esa definición puede clasificar cómo inseguros los principales procesos de Finanzas y Growth, por ejemplo, consideraremos a menudo el término **percance**.

> Un percance es un **evento no planeado** o secuencia de eventos que pueden producir daños catastróficos.

Por mayores que sean su similitud con la definición de **fiabilidad**, se debe considerar la diferencia en su énfasis. La fiabilidad es la medida de éxito con la cual el sistema se ajusta a la especificación de su comportamiento, normalmente en términos de **probabilidad**. La seguridad, sin embargo, es la **improbabilidad de que se den las condiciones que conducen a un percance, independientemente si se realiza la función prevista**.

### Integridad
> Es la ausencia de condiciones que pueden llevar a alteraciones inapropiadas de los datos en producción. Es la **improbabilidad de que se den las condiciones que alteran en producción datos inapropiados, independientemente si se realiza la función prevista**.

### Mantenimiento
> Capacidad de superar reparaciones y evolucionar.

### Escalabilidad
> Capacidad de adecuación al negocio.

## Mecanismos
Mecanismos de Quality Assurance.

### Prevención de Fallos : Evitación
Existen dos fases en la prevención de fallos: **evitación y eliminación**.
Con la evitación se intenta limitar la introducción de datos y objetos potencialmente defectuosos durante la ejecución del proceso. Como:
* La utilización de fuentes de información validadas y limpias (cuando sea posible).
* La introducción de procesos de limpieza y validación de los datos (data cruda).
* La introducción de validación de disponibilidad de tablas y columnas, y la introducción de operadores de rama para su manejo.

### Tolerancia de Fallos
Debido a las limitaciones en las prevenciones de fallos, una vez que la data y los procesos cambian con frecuencia, es necesario recurrir a la tolerancia de fallos.

Existen diferentes niveles de tolerancia a fallos:
* **Tolerancia total**: no hay manejo de condiciones adversas o no deseadas, el DAG no se adapta a las validaciones y variables de entorno (xcom) u otras informaciones externas para la ejecución de los tasks.
* **Degradación controlada** (o caída suave): notificaciones serán disparadas (opsgenie, slack) en la presencia de fallos, y siendo el suficiente importantes para interrumpir el flujo de tareas (thresholds, inexistencia o indisponibilidad de la data), los operadores de rama seleccionarán los tasks subsiguientes.
* **Fallo seguro**: los fallos detectados son suficientes para detectar que el proceso no debe ocurrir, un operador de cortocircuito cancela la ejecución de los subsiguientes tasks, el negocio es notificado (slack, correo), y caso no exista un proceso automático para lidiar con el problema, el equipo de data puede tomar acciones como volver a ejecutar los DAGs que generan los inputs necesarios, o escalar el caso.

El diseño de los DAGs tolerantes a fallos supone:
* Los algoritmos de los tasks se han diseñado correctamente.
* Se conocen todos los posibles modos de fallos de los componentes.
* Se han tenido en cuenta todas las posibles interacciones entre el DAG y su entorno.

#### Redundancia
Todas las técnicas utilizadas para conseguir tolerancia a fallos se basan en añadir elementos externos al sistema para que detecte y se recupere de fallos. Estos elementos son redundantes en el sentido de que no son necesarios para el normal funcionamiento del sistema, a esto llamamos **redundancia protectora**. El objetivo de la tolerancia es minimizar la redundancia, maximizando la fiabilidad, siempre bajo las restricciones de complejidad y tamaño del sistema. Se debe tener cuidado al diseñar los sistemas tolerantes a fallos, ya que los componentes incrementan la complejidad y mantenimiento de todo el sistema, lo que puede en sí, conducir a sistemas menos fiables.

Clasificamos la redundancia en los sistemas en estáticas y dinámicas. La **redundancia estática**, o enmascaramiento, consiste en que los componentes redundantes son utilizados para ocultar los efectos de los fallos. La **redundancia dinámica** es la redundancia aportada dentro de un componente que hace que el mismo indique, implícita o explícitamente, que la salida es errónea; la recuperación debe ser proporcionada por otro componente. Esta técnica de tolerancia a fallos tiene cuatro fases:
1. **Detección de errores**: no se utilizará ningún esquema de tolerancia a fallos hasta que se haya detectado un error.
2. **Confinamiento y valoración de daños**: cuando se detecte un error, debe estimarse la extensión del sistema que ha sido corrompida (diagnóstico de error).
3. **Recuperación del error**: este es uno de los aspectos más importantes de la tolerancia a fallos. Las técnicas de recuperación de errores deberían dirigir al sistema corrupto a un estado a partir del cual pueda continuar con su normal funcionamiento (quizás con una degradación funcional).
4. **Tratamiento del fallo y continuación del servicio**: un error es un síntoma de un fallo; aunque el daño pudiera haber sido reparado, el fallo continúa existiendo, y por lo tanto el error puede volver a darse a menos que se realice algún tipo de mantenimiento.

##### Detección de errores
La efectividad de un sistema tolerante a fallos depende de la **efectividad de detección de errores**, los cuales clasificaré en:
* **Detecciones en el entorno**. Los errores se detectan en el entorno en el cual se ejecutan el programa. Son manejados por las excepciones (exceptions).
* **Detección en la aplicación**. Los errores se detectan en la misma aplicación.
  * **Comprobaciones inversas**. Aplicadas en componentes de relación isomórfica (uno a uno) entre la entrada y la salida. En este método, se toma la salida y se calcula la entrada, lo cual es comparado con el valor de entrada original. Para casos de números reales, es necesario adoptar técnicas de comparación inexactas.
  * **Comprobación de racionalidad**. Se basan en el conocimiento del diseño y de la construcción del sistema. Comprueban que el estado de los datos o el valor de un objeto es razonable basándose en su supuesto uso.

##### Confinamiento y valoración de los daños
Siempre existirá una magnitud de tiempo, entre la ocurrencia de un defecto y la detección del error, siendo por lo tanto importante la valoración de cualquier daño que se haya podido producir en este intervalo de tiempo.

Aunque el tipo de error detectado podrá dar ideas sobre el daño a la rutina de tratamiento del error, podrían haber sido diseminadas informaciones erróneas por el sistema y su entorno. Así, la valoración de los daños estará directamente relacionada con las precauciones tomadas por el diseñador de este sistema para el confinamiento del daño (**construcción de cortafuegos**). El confinamiento del daño se refiere a la estructuración del sistema de modo que se minimicen los daños causados por un componente defectuoso.

Existen dos técnicas principales para estructurar los sistemas de modo que se facilite el confinamiento de daños: **descomposición modular** y **acciones atómicas**. Por descomposición modular entiéndase que los sistemas deben ser descompuestos en componentes, cada uno de los cuales se representa por uno o más módulos. La interacción de los componentes se produce a través de interfaces bien definidas, y los detalles internos de los módulos están ocultos y no son accesibles directamente desde el exterior. Esto hace más difícil que un error en un componente pase indiscriminadamente a otro.

La descomposición modular proporciona al sistema una estructura estática, ya las acciones atómicas proporcionan al mismo una estructura dinámica. Se dice que una acción es atómica si no existen interacciones entre la actividad y el sistema durante el transcurso de la acción. Estas acciones se utilizan para mover el sistema de un estado consistente a otro, y para restringir el flujo de información entre los componentes.

##### Recuperación de errores
Una vez detectada la situación de error, y que sus posibles daños hayan sido valorados, se inician los procedimientos de recuperación de errores. Esta fase es probablemente la más importante dentro de las técnicas de tolerancia a fallos, la cual debe transformar un estado erróneo del sistema en otro desde el cual el sistema pueda continuar con su funcionamiento normal, quizás con una cierta degradación en el servicio.

Aquí citaré dos estrategias para la recuperación de errores: recuperación **hacia adelante**, y **hacia atrás**. La recuperación de errores hacia adelante intenta continuar desde el estado erróneo realizando correcciones selectivas en el estado del sistema, que incluye proteger cualquier aspecto del entorno controlado que pudiera ser puesto en riesgo o dañado por el fallo.

La recuperación hacia atrás se basa en restaurar el sistema a un estado seguro previo a aquél en el que se produjo el error, para luego ejecutar una sección alternativa de la tarea. Ésta tendrá la misma funcionalidad que la sección que produjo el defecto, pero utilizando un algoritmo distinto. Se espera que esta alternativa no produzca el mismo defecto que la versión anterior, así que dependerá del conocimiento del diseñador sobre los posibles modos de fallo de este componente.

El diseñador debe tener claro los niveles de degradación de un servicio, teniendo en cuenta los servicios y procesos que dependen de éste.

##### Tratamiento de los fallos y servicio continuado
Un error es una manifestación de un defecto, y aunque la fase de recuperación del error puede haber llevado el sistema a un estado libre de error, el error se puede volver a producir. Por lo tanto, la fase final de la tolerancia de fallos es erradicar el fallo del sistema, de forma que se pueda continuar con el servicio normal.

### Prevención de Fallos: Eliminación
La segunda fase de prevención de fallos es la eliminación de fallos. Consiste normalmente en procedimientos para encontrar y eliminar las causas de los errores. Aunque se pueden utilizar técnicas como los revisores de código (Visual Studio, Data Grip, etc.) y el debugging en local (Astronomer), ni siempre se llevan a cabo las revisiones por pares y pruebas exhaustivas con las distintas combinaciones de estados de entrada y entorno. 

Las pruebas en qa (BIC) no pueden verificar que los valores de salida sean compatibles con el negocio y sus aplicaciones, así que se concentran normalmente en modos de fallo de tiempo (timeouts) y **defectos**. Desafortunadamente, la prueba del sistema no puede ser exhaustiva y eliminar todos los potenciales fallos, principalmente por:
* Las pruebas se utilizan para demostrar la presencia de fallos, no su ausencia.
* La dificultad de realizar pruebas en producción. La manera de probar fallas en producción son del tipo **combate real**, o sea, la consecuencia de los errores pueden afectar directamente el negocio, haciendo que pueda tomar malas decisiones (ej: un mal cálculo de GMV o de CAC, puede además de llevar a acciones erróneas, disminuir la confianza del negocio en los procesos de data). Existen alternativas de diseño de DAGs para detección de fallos en producción, las cuales discutiré más adelante.
* Los errores que han sido introducidos en la etapa de requisitos del sistema puede que no se manifiesten hasta que el sistema esté operativo. Ejemplos:
Un DAG para el procesamiento y limpieza de la data de delivery de las campañas de Singular (input para Global Online Cost) que se diseñó para ejecutar antes del proceso de atribución de media, a las 4am, no llevó en consideración que la data no estará disponible hasta las 5am.

### Predicción de Fallos
La predicción acurada y rápida de los fallos posibilita a los que mantenemos los procesos asegurar mayor disponibilidad de los servicios. Desafortunadamente, la predicción de fallos es muchísimo menos sencilla que su detección.

Para poder predecir un fallo, éste debe ser identificado y clasificado. Los fallos también deben ser predecibles (o capaces de predicción), lo que significa que existen alteraciones de estados de los sistemas (y componentes) que llevan al fallo, o el fallo ocurre regularmente siguiendo algún patrón. Ambos casos pueden ser traducidos a problemas de predicción de series temporales, y la data de los sensores y logs puede ser trabajada para entrenar los modelos de predicción.

La data colectada muy difícilmente estará lista para ser utilizada por los modelos de predicción, así que uno o más tareas de preprocesamiento deben llevarse a cabo:
* **Sincronización de la data**: las métricas colectadas por diversos agentes (sensores) deben alinearse en la dimensión de tiempo.
* **Limpieza de la data**: remoción de data innecesaria, y generación de data faltante (ej: interpolación).
* **Normalización de la data**: los valores de las métricas son normalizados para que las magnitudes sean comparables.
* **Selección de features**: las métricas relevantes son identificadas para su utilización en los modelos.

Una vez preprocesada la data, la misma será utilizada en dos pipelines: pipeline de entrenamiento, y pipeline de inferencia. El pipeline de entrenamiento usa la data en bulk, para entrenar el modelo a ser disponibilizado al pipeline de inferencia. Los resultados de la inferencia indicará la existencia o no de tipos específicos de fallas, sobre la muestra de métricas monitoreadas.
