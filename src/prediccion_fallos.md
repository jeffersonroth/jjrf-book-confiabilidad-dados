# Predicción de Fallos
La predicción acurada y rápida de los fallos posibilita a los que mantenemos los procesos asegurar mayor disponibilidad de los servicios. Desafortunadamente, la predicción de fallos es muchísimo menos sencilla que su detección.

Para poder predecir un fallo, éste debe ser identificado y clasificado. Los fallos también deben ser predecibles (o capaces de predicción), lo que significa que existen alteraciones de estados de los sistemas (y componentes) que llevan al fallo, o el fallo ocurre regularmente siguiendo algún patrón. Ambos casos pueden ser traducidos a problemas de predicción de series temporales, y la data de los sensores y logs puede ser trabajada para entrenar los modelos de predicción.

La data colectada muy difícilmente estará lista para ser utilizada por los modelos de predicción, así que uno o más tareas de preprocesamiento deben llevarse a cabo:
* **Sincronización de la data**: las métricas colectadas por diversos agentes (sensores) deben alinearse en la dimensión de tiempo.
* **Limpieza de la data**: remoción de data innecesaria, y generación de data faltante (ej: interpolación).
* **Normalización de la data**: los valores de las métricas son normalizados para que las magnitudes sean comparables.
* **Selección de features**: las métricas relevantes son identificadas para su utilización en los modelos.

Una vez preprocesada la data, la misma será utilizada en dos pipelines: pipeline de entrenamiento, y pipeline de inferencia. El pipeline de entrenamiento usa la data en bulk, para entrenar el modelo a ser disponibilizado al pipeline de inferencia. Los resultados de la inferencia indicará la existencia o no de tipos específicos de fallas, sobre la muestra de métricas monitoreadas.