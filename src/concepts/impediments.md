# Impedimentos

## Fallos, Errores y Defectos
> Los **fallos** son el resultado de problemas internos no esperados que el sistema manifiesta eventualmente en su comportamiento externo. Estos problemas se llaman **errores**, y sus causas mecánicas o algorítmicas se denominan **defectos**. Cuando el comportamiento de un sistema se desvía del especificado para él, se dice que es un fallo.

Los sistemas están compuestos de **componentes**, cada uno de los cuales se puede considerar como un sistema en sí mismo. Así, un fallo en un sistema puede inducir un defecto en otro, el cual puede acabar en un error y en un fallo potencial de este sistema. Esto puede continuar y producir un efecto en cualquier sistema relacionado, y así sucesivamente.

Un componente defectuoso de un sistema es un componente que producirá un error bajo un conjunto concreto de circunstancias durante la vida del sistema. Visto en términos de transición de estados, *un sistema puede ser considerado como un número de estados externos e internos*. 

Un estado externo no especificado en el comportamiento del sistema se considerará un fallo del sistema. El sistema en sí mismo consta de un número de componentes (cada uno con sus propios estados), contribuyendo todos ellos al comportamiento externo del sistema. La combinación de los estados de estos componentes se denomina estado interno del sistema. *Un estado interno no especificado se considera un error, y el componente que produjo la transición de estados ilegal se dice que es defectuoso*.

Definiré tres tipos de fallos:
* **Fallos transitorios**: comienza en un instante de tiempo concreto, se mantiene en el sistema durante algún periodo de tiempo, y luego desaparece.
* **Fallos permanentes**: comienzan en un instante determinado y permanecen en el sistema hasta que son reparados.
* **Fallos intermitentes**: son fallos transitorios que ocurren de vez en cuando.

## Modos de Fallos
> Un sistema puede fallar de muchas maneras. Un diseñador puede diseñar el sistema suponiendo un número finito de modos de fallo, sin embargo el sistema puede fallar de manera diferente a lo esperado. 

Podemos clasificar los modos de fallos de los servicios que proporciona un sistema, los cuales:
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