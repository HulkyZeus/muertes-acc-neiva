<template>
  <div class="m-16 ">
    <div class="flex items-center justify-between gap-4">
      <span class="text-sm text-gray-600">
        Sesión:
        <strong v-if="canEdit"> {{ loginUser?.nombre + " - " + loginUser?.correo + " - " + loginUser?.rol }} </strong>
        <strong v-else-if="isGuest"> Invitado (solo lectura) </strong>
        <strong v-else> No autenticado </strong>
      </span>

      <fwb-button v-if="canEdit" color="red" @click="cerrarSesion">
        Cerrar sesión
      </fwb-button>
      <fwb-button v-else color="green" @click="abrirModalLogin" >Iniciar Sesión</fwb-button>

    </div>
    <p class="text-5xl font-bold"> Muertes Accidentes Tránsito del Municipio de Neiva</p>

    <div class="flex my-5 mt-7 col-md-12 items-end">

      <div class="w-2/12 mr-2">
        <label for="Desde" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Desde</label>
        <Datepicker v-model="selectedSinceDate" />
      </div>
      <div class="w-2/12 mr-2">
        <label for="Hasta" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Hasta</label>
        <Datepicker v-model="selectedUntilDate" />
      </div>
      <div class="w-2/12 mr-2">
        <label for="Hasta" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Comuna /
          Corregimiento</label>
        <fwb-select v-model="comunaCorregimiento" :options="opcionesComuna" placeholder="Seleccione..." />

        </div>
      <div class="w-2/12">
        <label for="TipoDeVia" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Tipo de via</label>
        <fwb-select v-model="tipoDeVia" :options="opcionesTipoVia" placeholder="Seleccione..." />
      </div>
      <fwb-button color="default" class="ml-2 h-10 w-1/12" @click="filtrarDatos()">Buscar</fwb-button>
      <fwb-button color="red" class="ml-2 h-10 w-1/12" @click="limpiarFiltro()">Limpiar</fwb-button>

      <div class="w-3/12 flex justify-end ">

        <fwb-button color="green" class="mx-1 h-10 " @click="abrirModalCrear()" :disabled="!canEdit">Añadir</fwb-button>
        <fwb-button-group>
          <fwb-button color="alternative" @click="exportarDatos('excel')"><i class="pi pi-file-excel"> </i> Exportar a
            <span class="text-lime-700">EXCEL
            </span> </fwb-button>
          <fwb-button color="alternative" @click="exportarDatos('pdf')"><i class="pi pi-file-pdf"> </i> Exportar a <span
              class="text-red-600">PDF</span> </fwb-button>
        </fwb-button-group>
      </div>

    </div>
    <fwb-alert v-if="showSuccessAlert" type="success" class="my-4" @dismissed="showSuccessAlert = false">
      Registro guardado correctamente.
    </fwb-alert>
    <div>
      <fwb-table striped>
        <fwb-table-head>
          <fwb-table-head-cell v-for="(key, index) in tableKeys" :key="key" @click="sortBy(key)"
            class="cursor-pointer hover:bg-gray-100">
            {{ tableHeadings[index] }}
            <span v-if="sortKey === key">
              {{ sortOrder === 1 ? '▲' : '▼' }}
            </span>
          </fwb-table-head-cell>

          <fwb-table-head-cell>
            <span class="sr-only">Editar</span>
          </fwb-table-head-cell>
          <fwb-table-head-cell>
            <span class="sr-only">Eliminar</span>
          </fwb-table-head-cell>
        </fwb-table-head>

        <fwb-table-body>

          <template v-if="tableData.length > 0">
            <fwb-table-row v-for="(item, index) in paginatedData" :key="item.id || index">
              <fwb-table-cell>{{ item.FechayHoradelHecho }}</fwb-table-cell>
              <fwb-table-cell>{{ item.DiadelHecho }}</fwb-table-cell>
              <fwb-table-cell>{{ item.ComunaCorregimiento }}</fwb-table-cell>
              <fwb-table-cell>{{ item.Tipodevia }}</fwb-table-cell>
              <fwb-table-cell>{{ item.Clasedeaccidente }}</fwb-table-cell>
              <fwb-table-cell>{{ item.Genero }}</fwb-table-cell>
              <fwb-table-cell>{{ item.Edad }}</fwb-table-cell>
              <fwb-table-cell>{{ item.Caracteristicasdelavictima }}</fwb-table-cell>
              <fwb-table-cell>{{ item.Vehiculodelavictima }}</fwb-table-cell>
              <fwb-table-cell>{{ item.Vehiculovinculado1 }}</fwb-table-cell>
              <fwb-table-cell>{{ item.Vehiculovinculado2 }}</fwb-table-cell>
              <fwb-table-cell>{{ item.Vehiculovinculado3 }}</fwb-table-cell>

              <fwb-table-cell>
                <fwb-a href="#" @click.prevent="updateRecord(item)" class="text-blue-600"
                  :class="{ 'opacity-40 pointer-events-none': !canEdit }">Editar</fwb-a>
              </fwb-table-cell>
              <fwb-table-cell>
                <fwb-a href="#" @click.prevent="deleteRecord(item.id)" class="text-red-600"
                  :class="{ 'opacity-40 pointer-events-none': !canEdit }">Eliminar</fwb-a>
              </fwb-table-cell>
            </fwb-table-row>
          </template>

          <fwb-table-row v-else>
            <fwb-table-cell colspan="14" class="text-center py-4 bg-gray-50 dark:bg-gray-800">
              <div class="text-lg text-center font-medium text-gray-700 dark:text-gray-300">
                ⚠️ No hay datos para mostrar.
              </div>
            </fwb-table-cell>
          </fwb-table-row>

        </fwb-table-body>
      </fwb-table>
    </div>
    <div class="text-right mt-3 text-gray-700"> Mostrando {{ tableData.length < 5 ? tableData.length : 5 }} registros de
        {{ tableData.length }}</div>

        <div class="flex justify-center mt-3">
          <fwb-pagination v-model="currentPage" :total-items="tableData.length" :per-page="itemsPerPage" large
            hide-labels show-icons />
        </div>
        <ModalFormulario ref="modalRef" @guardado="handleGuardado" />
        <ModalLogin ref="modalLoginRef" @guest="handleGuest" @login-success="handleLoginSuccess" />
        <div>
          <EstadisticasDashboard :key="dashboardKey" />
        </div>
    </div>

</template>

<script setup>
import Datepicker from '@/components/Datepicker.vue';
import EstadisticasDashboard from '@/components/EstadisticasDashboard.vue';
import ModalLogin from '@/components/ModalLogin.vue';
import ModalFormulario from '@/components/ModalFormulario.vue';
import {
  FwbA,
  FwbAlert,
  FwbTable,
  FwbTableBody,
  FwbTableCell,
  FwbTableHead,
  FwbTableHeadCell,
  FwbTableRow,
  FwbButton,
  FwbPagination,
  FwbButtonGroup,
  FwbSelect
} from 'flowbite-vue'
import { ref, computed, onMounted } from 'vue'
const selectedSinceDate = ref('');
const selectedUntilDate = ref('');
const comunaCorregimiento = ref('');
const tipoDeVia = ref('');
const modalRef = ref(null);
const modalLoginRef = ref(null);
const showSuccessAlert = ref(false);
const loginUser = ref(null);
const isGuest = ref(false);
const dashboardKey = ref(0);

function recargarDashboard() {
  dashboardKey.value++;  
}
const canEdit = computed(() => {
  return loginUser.value && !isGuest.value;
});
const opcionesTipoVia = [
  { value: "Municipal", name: "Municipal" },
  { value: "Departamental", name: "Departamental" },
  { value: "Nacional", name: "Nacional" }
];
const opcionesComuna = [
    { name: 'Comuna 1', value: '1' },
    { name: 'Comuna 2', value: '2' },
    { name: 'Comuna 3', value: '3' },
    { name: 'Comuna 4', value: '4' },
    { name: 'Comuna 5', value: '5' },
    { name: 'Comuna 6', value: '6' },
    { name: 'Comuna 7', value: '7' },
    { name: 'Comuna 8', value: '8' },
    { name: 'Comuna 9', value: '9' },
    { name: 'Comuna 10', value: '10' },
    { name: 'El Caguán', value: 'El Caguán' },
    { name: 'Guacirco', value: 'Guacirco' },
    { name: 'Chapinero', value: 'Chapinero' },
    { name: 'Vegalarga', value: 'Vegalarga' },
    { name: 'Ninguna', value: 'Ninguna' }
]

function abrirModalLogin() {
  modalLoginRef.value?.open()
}


function abrirModalCrear() {
  if (!canEdit.value) {
    alert('Debe iniciar sesión para agregar registros.')
    return
  }
  modalRef.value?.open()
}

function updateRecord(item) {
  if (!canEdit.value) {
    alert('Debe iniciar sesión para editar registros.')
    return
  }
  modalRef.value?.openForEdit(item)
}
function handleLoginSuccess(user) {
  loginUser.value = user
  isGuest.value = false
}

async function cerrarSesion() {
  try {
    const r = await fetch(`${API_BASE}/api/logout`, {
      method: "POST",
      credentials: "include"
    });

    if (!r.ok) throw new Error("Error cerrando sesión");

    // Regresar a modo invitado
    loginUser.value = null;
    isGuest.value = true;

    alert("Sesión cerrada exitosamente");

    // Si quieres mostrar el modal de login inmediatamente:
    // loginModalRef.value?.open();

  } catch (error) {
    console.error("Error al cerrar sesión:", error);
  }
}


async function handleGuardado() {
  // 1. Recargar datos
  await consultarDatos()

  // 2. Mostrar alerta bonita (además del alert() del hijo si lo dejas)
  showSuccessAlert.value = true

  // 3. Ocultar alerta después de unos segundos (opcional)
  setTimeout(() => {
    showSuccessAlert.value = false
  }, 3000)
}
function handleGuest() {
  loginUser.value = null
  isGuest.value = true
}

// --- ENCABEZADOS / KEYS (manténlos si quieres la misma tabla visual) ---
const tableHeadings = [
  'Fecha y Hora del Hecho',
  'Día del Hecho',
  'Comuna / Corregimiento',
  'Tipo de Vía',
  'Clase de Accidente',
  'Género',
  'Edad',
  'Características de la Víctima',
  'Vehículo de la Víctima',
  'Vehículo Vinculado 1',
  'Vehículo Vinculado 2',
  'Vehículo Vinculado 3'
]

// Las claves aquí deben coincidir con las propiedades que tendrá cada elemento en `tableData`
const tableKeys = [
  'FechayHoradelHecho',   // mostramos texto legible, pero en cada objeto añadimos FechaISO para ordenar por fecha
  'DiadelHecho',
  'ComunaCorregimiento',
  'Tipodevia',
  'Clasedeaccidente',
  'Genero',
  'Edad',
  'Caracteristicasdelavictima',
  'Vehiculodelavictima',
  'Vehiculovinculado1',
  'Vehiculovinculado2',
  'Vehiculovinculado3'
]

// reactive container para los datos de la tabla
const tableData = ref([])

// PAGINACIÓN
const currentPage = ref(1);
const itemsPerPage = 5;

const paginatedData = computed(() => {
  const start = (currentPage.value - 1) * itemsPerPage;
  const end = start + itemsPerPage;
  return sortedData.value.slice(start, end);
});

// ORDENAMIENTO
const sortKey = ref(null);
const sortOrder = ref(1);

/**
 * normalize/compara valores para ordenar:
 * - si es fecha (clave FechayHoradelHecho) usa FechaISO
 * - si son números compara como números
 * - si son strings compara en minúsculas
 */
function compareValues(a, b, key) {
  // caso fecha: usamos FechaISO si existe
  if (key === 'FechayHoradelHecho') {
    const da = Date.parse(a.FechaISO || a.FechayHoradelHecho || '');
    const db = Date.parse(b.FechaISO || b.FechayHoradelHecho || '');
    if (isNaN(da) && isNaN(db)) return 0;
    if (isNaN(da)) return -1;
    if (isNaN(db)) return 1;
    return da - db;
  }

  const va = a[key];
  const vb = b[key];

  // números
  const na = parseFloat(va);
  const nb = parseFloat(vb);
  if (!isNaN(na) && !isNaN(nb)) {
    return na - nb;
  }

  // strings
  const sa = (va === null || va === undefined) ? '' : String(va).toLowerCase();
  const sb = (vb === null || vb === undefined) ? '' : String(vb).toLowerCase();
  if (sa < sb) return -1;
  if (sa > sb) return 1;
  return 0;
}

function sortBy(key) {
  if (sortKey.value === key) {
    sortOrder.value = sortOrder.value * -1;
  } else {
    sortKey.value = key;
    sortOrder.value = 1;
  }
  currentPage.value = 1;
}

const sortedData = computed(() => {
  const data = [...tableData.value]; // copia para no mutar original
  if (!sortKey.value) return data;
  return data.sort((a, b) => {
    const cmp = compareValues(a, b, sortKey.value);
    return cmp * sortOrder.value;
  });
});

// --- FETCH / MAPEADO DE LA RESPUESTA DE LA API ---
// Ajusta la base si es necesario
const API_BASE = "http://127.0.0.1:5000";

onMounted(() => {
  consultarDatos();
});
const consultarDatos = async () => {
  try {
    const r = await fetch(`${API_BASE}/api/accidentes`);
    if (!r.ok) throw new Error(`HTTP ${r.status}`);
    const res = await r.json();
    const data = res.items;
    mapearDatos(data);
  } catch (error) {
    // muestra en consola; puedes reemplazar por un toast o UI visible
    console.error('Error cargando accidentes:', error);
    tableData.value = []; // fallback
  }
};

const mapearDatos = (data) => {
  // data se asume como Array de objetos con claves snake_case (igual al ejemplo que pegaste)
  // mapeamos cada objeto para ajustarlo a las claves que usa la tabla y añadimos FechaISO para ordenar por fecha
  const mapped = (Array.isArray(data) ? data : []).map((obj) => {
    // fecha: la API puede venir con `fecha_del_hecho` ya con hora o separado en hora_del_hecho
    // intentamos construir una ISO completa para comparaciones
    let fechaISO = null;
    if (obj.fecha_del_hecho) {
      // si la fecha ya trae 'T' y hora (ej. "2012-01-01T00:00:00"), y hay hora_del_hecho no redundamos
      if (obj.fecha_del_hecho.includes('T')) {
        // si hora_del_hecho tiene valor distinto a '00:00:00' preferimos combinar
        if (obj.hora_del_hecho && obj.hora_del_hecho.trim() !== '' && !obj.hora_del_hecho.startsWith('00:00')) {
          // construir ISO: fecha parte antes de 'T' + 'T' + hora (aseguramos segundos)
          const datePart = obj.fecha_del_hecho.split('T')[0];
          fechaISO = `${datePart}T${obj.hora_del_hecho}`;
        } else {
          fechaISO = obj.fecha_del_hecho;
        }
      } else {
        // caso extraño: fecha sin T -> asumimos formato YYYY-MM-DD y combinamos con hora
        const timePart = obj.hora_del_hecho ? obj.hora_del_hecho : '00:00:00';
        fechaISO = `${obj.fecha_del_hecho}T${timePart}`;
      }
    }

    // presentación amigable para la tabla (fecha legible)
    const presentDate = fechaISO
      ? (new Date(fechaISO).toLocaleString('es-CO', { year: 'numeric', month: '2-digit', day: '2-digit', hour: '2-digit', minute: '2-digit', second: '2-digit' }))
      : (obj.fecha_del_hecho || '') + (obj.hora_del_hecho ? ` ${obj.hora_del_hecho}` : '');

    // Si comuna viene numérica, formateamos como "Comuna X"
    let comunaPresent = obj.comuna_corregimiento;
    if (comunaPresent !== null && comunaPresent !== undefined) {
      // si es número o string numérico
      if (!isNaN(parseInt(comunaPresent))) {
        comunaPresent = `Comuna ${comunaPresent}`;
      } else {
        // dejamos el texto tal cual si no es número
        comunaPresent = String(comunaPresent);
      }
    } else {
      comunaPresent = 'Desconocida';
    }

    return {
      // mantenemos id si existe para key en v-for
      id: obj.id ?? null,
      // campos mostrados en la tabla (matched con tableKeys)
      FechayHoradelHecho: presentDate,
      FechaISO: fechaISO, // sólo para ordenar internamente
      DiadelHecho: obj.dia_de_la_semana ?? '',
      ComunaCorregimiento: comunaPresent,
      Tipodevia: obj.tipo_de_via_de_hechos ?? obj.tipo_de_via ?? '',
      Clasedeaccidente: obj.clase_de_accidente ?? '',
      Genero: obj.genero ?? '',
      Edad: obj.edad ?? '',
      Caracteristicasdelavictima: obj.caracteristicas_de_la_victima ?? '',
      Vehiculodelavictima: obj.vehiculo_de_la_victima ?? '',
      // campos vinculados si existen, si no -> 'Ninguno'
      Vehiculovinculado1: obj.vehiculo_2_de_la_contraparte ?? obj.vehiculo_2_de_la_contraparte ?? 'Ninguno',
      Vehiculovinculado2: obj.vehiculo_3_de_la_contraparte ?? obj.vehiculo_3_de_la_contraparte ?? 'Ninguno',
      Vehiculovinculado3: obj.vehiculo_4_de_la_contraparte ?? obj.vehiculo_4_de_la_contraparte ?? 'Ninguno',
      // si quieres mantener el objeto original:
      _original: obj
    };
  });

  tableData.value = mapped;
}

const limpiarFiltro = () => {
  selectedSinceDate.value = '';
  selectedUntilDate.value = '';
  consultarDatos();
}
const formatDateForAPI = (dateString) => {
  if (!dateString || dateString.length !== 10) return null;
  const parts = dateString.split('/'); // parts = ['DD', 'MM', 'YYYY']
  // Si el formato es DD/MM/YYYY, reordenamos a YYYY-MM-DD
  return `${parts[2]}-${parts[1]}-${parts[0]}`;
};
const filtrarDatos = async () => {
  try {
    const params = new URLSearchParams();
    if (selectedSinceDate.value) {
      const formattedSince = formatDateForAPI(selectedSinceDate.value);
      if (formattedSince) {
        params.append('fecha_desde', formattedSince);
      }
    }

    if (selectedUntilDate.value) {
      const formattedUntil = formatDateForAPI(selectedUntilDate.value);
      if (formattedUntil) {
        params.append('fecha_hasta', formattedUntil);
      }
    }

    if (comunaCorregimiento.value) {
      params.append('comuna_corregimiento', comunaCorregimiento.value);
    }

    if (tipoDeVia.value) {
      params.append('tipo_via', tipoDeVia.value);
    }

    const url = `${API_BASE}/api/accidentes?${params.toString()}`;
    const r = await fetch(url);
    console.log(url)
    if (!r.ok) throw new Error(`HTTP ${r.status}`);
    const res = await r.json();
    const data = res.items;
    mapearDatos(data);
  } catch (error) {
    // muestra en consola; puedes reemplazar por un toast o UI visible
    console.error('Error cargando accidentes:', error);
    tableData.value = []; // fallback
  }

};

const exportarDatos = async (formato) => {
  const params = new URLSearchParams();

  // 1. Agregar el formato
  params.append('formato', formato); // 'excel' o 'pdf'

  // 2. Agregar los filtros de fecha (deben estar en YYYY-MM-DD)
  if (selectedSinceDate.value) {
    const formattedSince = formatDateForAPI(selectedSinceDate.value);
    if (formattedSince) {
      params.append('fecha_desde', formattedSince);
    }
  }

  if (selectedUntilDate.value) {
    const formattedUntil = formatDateForAPI(selectedUntilDate.value);
    if (formattedUntil) {
      params.append('fecha_hasta', formattedUntil);
    }
  }

   if (comunaCorregimiento.value) {
      params.append('comuna_corregimiento', comunaCorregimiento.value);
    }

    if (tipoDeVia.value) {
      params.append('tipo_via', tipoDeVia.value);
    }

  const url = `${API_BASE}/api/exportar?${params.toString()}`;
  console.log('Exportando datos desde URL:', url);
  try {
    const response = await fetch(url);

    if (!response.ok) {
      // Manejar errores como 404 (No hay datos) o 500 (Error del servidor)

      const errorText = await response.text();
      try {
        const errorJson = JSON.parse(errorText);
        console.error(`Error de exportación (${response.status}):`, errorJson.error || errorJson.message);
      } catch (e) {
        console.error(`Error de exportación (${response.status}):`, errorText);
      }
      return;
    }

    // 4. Descargar el archivo
    const blob = await response.blob();
    const downloadUrl = window.URL.createObjectURL(blob);
    const a = document.createElement('a');

    // El nombre del archivo lo establece el backend (download_name)
    const contentDisposition = response.headers.get('Content-Disposition');
    let filename = `Muertes_Accidentes_Transito_Neiva.${formato === 'excel' ? 'xlsx' : 'pdf'}`; // Nombre por defecto

    if (contentDisposition) {
      // Intentar extraer el nombre del archivo si la cabecera existe
      const match = contentDisposition.match(/filename="?(.+)"?$/i);
      if (match && match[1]) {
        filename = match[1].replace(/;$/, ''); // Limpiar si hay punto y coma al final
      }
    }
    a.href = downloadUrl;
    a.download = filename;
    document.body.appendChild(a);
    a.click();
    a.remove();
    window.URL.revokeObjectURL(downloadUrl);

  } catch (error) {
    console.error('Fallo la exportación:', error);
  }
};
/**
 * DELETE: elimina un registro por id
 * - confirma con el usuario
 * - llama al endpoint DELETE
 * - si es ok, actualiza tableData y ajusta paginación
 */
async function deleteRecord(id) {
  if (!canEdit.value) {
    alert('Debe iniciar sesión para eliminar registros.')
    return
  }
  if (!id) {
    console.warn('ID inválido para eliminar:', id);
    return;
  }

  const ok = confirm('¿Seguro que deseas eliminar este registro? Esta acción no se puede deshacer.');
  if (!ok) return;

  try {
    const res = await fetch(`${API_BASE}/api/accidentes/${id}`, {
      method: 'DELETE',
      headers: {
        'Content-Type': 'application/json'
      },
      credentials: 'include' // si tu API requiere cookies/sesión
    });

    if (res.status === 204 || res.status === 200) {
      // eliminar del array local
      const idx = tableData.value.findIndex(x => x.id === id);
      if (idx !== -1) {
        tableData.value.splice(idx, 1);
      } else {
        // si no lo encuentra por id, filtra por _original.id si fuera distinto
        tableData.value = tableData.value.filter(x => (x.id ?? x._original?.id) !== id);
      }

      // ajustar currentPage si quedó vacía la página actual
      const totalPages = Math.max(1, Math.ceil(tableData.value.length / itemsPerPage));
      if (currentPage.value > totalPages) currentPage.value = totalPages;

      alert('Registro eliminado correctamente.');
    } else if (res.status === 404) {
      const body = await res.json().catch(() => ({}));
      alert('Registro no encontrado: ' + (body.message ?? 'No existe el id.'));
    } else {
      const text = await res.text();
      throw new Error(`Error al eliminar: ${res.status} - ${text}`);
    }
    recargarDashboard();
  } catch (err) {
    console.error('Error eliminando registro:', err);
    alert('Ocurrió un error eliminando el registro. Revisa la consola.');
  }
}
</script>
