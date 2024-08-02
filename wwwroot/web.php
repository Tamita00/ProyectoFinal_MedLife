Route::post('/Muestra/GuardarIndividual', 'MuestraController@guardarIndividual')->name('muestra.guardarIndividual');
Route::post('/Muestra/GuardarTodos', 'MuestraController@guardarTodos')->name('muestra.guardarTodos');

<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Muestra; // Asegúrate de importar el modelo Muestra si lo tienes definido

class MuestraController extends Controller
{
    public function guardarIndividual(Request $request)
    {
        $muestraId = $request->input('muestraId');
        $criterio = $request->input('criterio');
        $metodologias = $request->input('metodologias');

        // Aquí puedes validar los datos si es necesario
        // ...

        // Por ejemplo, guardar en la base de datos
        // Supongamos que tienes un modelo Muestra y quieres actualizar los datos
        $muestra = Muestra::find($muestraId);
        if (!$muestra) {
            return response()->json(['success' => false, 'message' => 'Muestra no encontrada']);
        }

        // Actualizar los campos
        $muestra->criterio = $criterio;
        $muestra->metodologia_1 = $metodologias[0];
        $muestra->metodologia_2 = $metodologias[1];
        // y así sucesivamente para las metodologías 3 a 6

        // Guardar los cambios
        $muestra->save();

        return response()->json(['success' => true]);
    }

    public function guardarTodos(Request $request)
    {
        $muestras = $request->json()->all();

        // Aquí puedes validar los datos si es necesario
        // ...

        // Iterar sobre cada muestra y guardar en la base de datos
        foreach ($muestras as $muestraData) {
            $muestra = Muestra::find($muestraData['Id']);
            if (!$muestra) {
                return response()->json(['success' => false, 'message' => 'Muestra no encontrada']);
            }

            // Actualizar el resultado u otros campos según necesites
            $muestra->resultado = $muestraData['Resultado'];

            // Guardar los cambios
            $muestra->save();
        }

        return response()->json(['success' => true]);
    }
}
