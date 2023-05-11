# EST-25134 Aprendizaje Estadístico

Este es el repositorio de datos para el curso Aprendizaje Estadístico de Primavera 2017. Aquí encontramos tanto los datos que estaremos estudiando en el curso. 

----

## Estudiados en clase

### I. *Curve Data* (1)

Datos simulados asociados con una curva de respuesta univariada.

_Proposito: Interpolacion/Prediccion._

Dataset: `Curve_Data.Rdata` 

### II. *Clasificion supervisada* (1)

Datos simulados para clasificacion supervisada (Y-variable dicotomica, (X1,X2)-estimulos continuos).

Dataset: `ClasifSup.Rdata` - 

----

## Proyecto de estudio

### A) *BBC News*

Descripción: Este conjunto de datos contiene un pequeño subconjunto de documentos de Wikipedia y noticias de la BBC. El conjunto de datos wikipedia tiene texto y matriz tf-idf. El conjunto de datos de la BBC viene sólo con el recuento de palabras.

Dataset: `bbcnews.Rdata`

_Proposito: Clasificacion no supervisada de textos._

### B) *Click prediction*

Descripción: Este conjunto de datos es de 2012 KDD Cup Track 2, donde la tarea es predecir la tasa de clics de los anuncios dados una consulta, la información de los anuncios (enlace) y la información del usuario. Haga clic aquí para obtener una descripción detallada de los datos.

El conjunto de datos original se divide en 3 partes: capacitación, pruebas y mapas desde el identificador de función a las características. El conjunto de entrenamiento tiene 150 M de instancias y los datos de prueba tienen 20 M de instancias. 

Dataset: `clickprediction.Rdata`

_Proposito: Prediccion._

### C) CoVaR

Descripcion: Este es un panel trimestral de $CoVaR$ y $\Delta CoVaR$, calculado en el 95- y 99- para todas las empresas en el período de la muestra de 1971-2013. ($\Delta$) CoVaR es una medida del riesgo sistémico calculada a partir de variables de estado subyacentes (por ejemplo, volatilidad de capital) y características de los bancos (por ejemplo, apalancamiento del libro) por Adrian y Brunnermeier (las variables estatales y las características bancarias provienen de los datos subyacentes. Detalles sobre el cálculo). Los datos proporcionados en este comunicado no pueden ser utilizados para reestimar ($\Delta$) $CoVaR$, o más generalmente, para reproducir los resultados del trabajo (para eso, los datos subyacentes son necesarios). El objetivo de este comunicado es facilitar el estudio de los riesgos específicos de las instituciones y del sistema por parte de otros académicos, responsables de políticas y participantes en el mercado.

Dataset: `CoVaR.Rdata`

_Proposito: Clasificacion no supervisada, prediccion, analisis de valores extremos._

### D) *Danish Insurance Car Data*

Descripcion: Esta base de datos se refiere a montos de reclamos de un portafolio de seguros de auto de Dinamarca. Los datos exhiben valores extremos.

_Proposito: Clasificacion no supervisada y prediccion._

Dataset: `DanishInsuranceMultivariate_Data.Rdata`

###  E) Diabetes

Descripción: Estos datos consisten en observaciones en 442 pacientes, siendo la respuesta de interés una medida cuantitativa de la progresión de la enfermedad un año después de la línea de base. Hay diez variables basales — edad, sexo, índice de masa corporal, presión arterial media y seis mediciones de suero sanguíneo — más términos cuadráticos, dando un total de 64 características.

_Proposito: Clasificacion supervisada y prediccion._

Dataset: `diabetes.Rdata`

### F) Netflix

Descripción: Este dataset es el conjunto de entrenamiento de Netflix Challenge, que contiene 99 millones de calificaciones de ids de usuario a ids de película. Cada línea tiene la forma de “ID de identificación de usuario".

Dataset: `netflix.Rdata`

_Proposito: Prediccion y clasificacion no supervisada._

### G) *Pregnancy data* (1)

Datos reales sobre embarazos prematuros en mujeres de EEUU (Y-variable dicotomica, X1-variable de estimulo, (Z1-Z4)-estimulo control).

_Proposito: Clasificacion supervisada y prediccion._

Dataset: `pregnancy.Rdata` - 

### H) *Stock prices*

Descripcion: Precios y retornos de activos financieros de empresas de tecnologia.

Dataset: `StockPrices.Rdata`

_Proposito: Clasificacion no supervisada y prediccion._

### I) Titanic

Descripcion: Esta base de datos se refiere a pasajeros del Titanic, indicando si los pasajeros sobrevivieron o no, asociando este evento con un conjunto de otras variables de los pasajeros.

_Proposito: Clasificacion supervisada._

Dataset: `titanic.Rdata`

-------

## Importación de datos en R

Empleando la libreria `repmis` de R, podemos importar los datos directamente de un repositorio en la web. Por ejemplo, para cargar los datos en R de los datos simulados de clasificacion supervizada, `ClasifSup.RData`, empleamos las siguientes opciones. 

Empleando la libreria `repmis`:
```
require("repmis")

source_data("https://github.com/jcmartinezovando/est25134_2017a/blob/master/datos/ClasifSup.RData?raw=true")
```
Noten que debemos especificar el path de los datos desde el repositorio en GitHub; este lo pueden encontrar seleccionando la opción `Copy path` que se despliega al seleccionar cada archivo da datos. Noten también que al final de la instrucción se incluye la especificación libre de formato para el archivo por importar.

Reemplazando el nombre del archivo a importar por el correspondiente en nuestro código hará accesible los datos en R.

Si no desean emplear `repmis`, pueden descargar los datos empleando el siguiente script:

```
githubURL <- "https://github.com/jcmartinezovando/est25134_2017a/raw/master/datos/ClasifSup.RData"

load(url(githubURL))
```
