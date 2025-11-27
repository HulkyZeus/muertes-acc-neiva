<template>
    <fwb-modal size="4xl" v-if="isShowModal" @close="closeModal">
        <template #header>
            <div class="flex items-center font-bold text-lg">
                {{ isEditing ? 'Editar Registro' : 'Agregar Nuevo Registro' }}
            </div>
        </template>

        <template #body>
            <form class="space-y-4" @submit.prevent="guardarAccidente">
                <div class="flex justify-between gap-4">
                    <!-- Fecha del hecho -->
                    <div class="w-full">
                        <label class="block mb-1 text-sm font-medium">Fecha del hecho</label>
                        <input type="date" v-model="form.fecha_del_hecho" :max="hoy"
                            class="w-full border-2 rounded px-2 py-1" required />
                    </div>

                    <!-- Día de la semana (auto) -->
                    <div class="w-full">
                        <label class="block mb-1 text-sm font-medium">Día de la semana</label>
                        <input type="text" v-model="form.dia_de_la_semana"
                            class="w-full border-2 rounded px-2 py-1 bg-gray-100" disabled />
                    </div>

                    <!-- Hora del hecho -->
                    <div class="w-full">
                        <label class="block mb-1 text-sm font-medium">Hora del hecho</label>
                        <input type="time" v-model="form.hora_del_hecho" class="w-full border-2 rounded px-2 py-1"
                            required />
                    </div>
                </div>

                <div class="flex justify-between gap-4">
                    <!-- Comuna / Corregimiento -->
                    <div class="w-full">
                        <label class="block mb-1 text-sm font-medium">Comuna / Corregimiento</label>
                        <select v-model="form.comuna_corregimiento" class="w-full border-2 rounded px-2 py-1" required>
                            <option value="" disabled>Seleccione...</option>
                            <option v-for="c in opcionesComuna" :key="c.value" :value="c.value">
                                {{ c.label }}
                            </option>
                        </select>
                    </div>

                    <!-- Tipo de vía de hechos -->
                    <div class="w-full">
                        <label class="block mb-1 text-sm font-medium">Tipo de vía de hechos</label>
                        <select v-model="form.tipo_de_via_de_hechos" class="w-full border-2 rounded px-2 py-1" required>
                            <option value="" disabled>Seleccione...</option>
                            <option value="Municipal">Municipal</option>
                            <option value="Departamental">Departamental</option>
                            <option value="Nacional">Nacional</option>
                        </select>
                    </div>

                    <!-- Género -->
                    <div class="w-full">
                        <label class="block mb-1 text-sm font-medium">Género</label>
                        <select v-model="form.genero" class="w-full border-2 rounded px-2 py-1" required>
                            <option value="" disabled>Seleccione...</option>
                            <option value="Femenino">Femenino</option>
                            <option value="Masculino">Masculino</option>
                            <option value="Indefinido">Indefinido</option>
                        </select>
                    </div>

                    <!-- Edad -->
                    <div class="w-full">
                        <label class="block mb-1 text-sm font-medium">Edad</label>
                        <input type="number" min="0" v-model.number="form.edad"
                            class="w-full border-2 rounded px-2 py-1" required />
                    </div>
                </div>

                <!-- Clase de accidente -->
                <div>
                    <label class="block mb-1 text-sm font-medium">Clase de accidente</label>
                    <select v-model="form.clase_de_accidente" class="w-full border-2 rounded px-2 py-1"
                        required>
                        <option value="" disabled>Seleccione...</option>
                        <option v-for="opt in opcionesClaseAccidente"  :value="opt.value" :key="opt.value">
                            {{ opt.label }}
                        </option>
                    </select>
                </div>

                <!-- Característica de la víctima -->
                <div>
                    <label class="block mb-1 text-sm font-medium">Característica de la víctima</label>
                    <select v-model="form.caracteristicas_de_la_victima" class="w-full border-2 rounded px-2 py-1"
                        required>
                        <option value="" disabled>Seleccione...</option>
                        <option v-for="opt in opcionesCaracteristicaVictima" :key="opt" :value="opt">
                            {{ opt }}
                        </option>
                    </select>
                </div>

                <!-- Vehículo de la víctima -->
                <div>
                    <label class="block mb-1 text-sm font-medium">Vehículo de la víctima</label>
                    <select v-model="form.vehiculo_de_la_victima" class="w-full border-2 rounded px-2 py-1" required>
                        <option value="" disabled>Seleccione...</option>
                        <option v-for="opt in opcionesVehiculo" :key="opt" :value="opt">
                            {{ opt }}
                        </option>
                    </select>
                </div>

                <!-- Vehículos vinculados -->
                <div class="grid grid-cols-1 md:grid-cols-3 gap-4">
                    <div>
                        <label class="block mb-1 text-sm font-medium">Vehículo vinculado 1</label>
                        <select v-model="form.vehiculo_2_de_la_contraparte" class="w-full border-2 rounded px-2 py-1"
                            >
                            <option value="" disabled>Seleccione...</option>
                            <option v-for="opt in opcionesVehiculo" :key="'v1-' + opt" :value="opt">
                                {{ opt }}
                            </option>
                        </select>
                    </div>
                    <div>
                        <label class="block mb-1 text-sm font-medium">Vehículo vinculado 2</label>
                        <select v-model="form.vehiculo_3_de_la_contraparte" class="w-full border-2 rounded px-2 py-1"
                            >
                            <option value="" disabled>Seleccione...</option>
                            <option v-for="opt in opcionesVehiculo" :key="'v2-' + opt" :value="opt">
                                {{ opt }}
                            </option>
                        </select>
                    </div>
                    <div>
                        <label class="block mb-1 text-sm font-medium">Vehículo vinculado 3</label>
                        <select v-model="form.vehiculo_4_de_la_contraparte" class="w-full border-2 rounded px-2 py-1"
                            >
                            <option value="" disabled>Seleccione...</option>
                            <option v-for="opt in opcionesVehiculo" :key="'v3-' + opt" :value="opt">
                                {{ opt }}
                            </option>
                        </select>
                    </div>
                </div>

                <!-- Botones -->
                <div class="flex justify-end gap-2 pt-4">
                    <fwb-button type="button" color="default" @click="onCancel">
                        Limpiar
                    </fwb-button>
                    <fwb-button type="button" color="red" @click="closeModal">
                        Cancelar
                    </fwb-button>
                    <fwb-button type="submit" color="green">
                        {{ isEditing ? 'Guardar cambios' : 'Guardar registro' }}
                    </fwb-button>
                </div>
            </form>
        </template>
    </fwb-modal>
</template>

<script setup lang="ts">
import { ref, defineExpose, watch } from 'vue'
import { FwbModal, FwbButton } from 'flowbite-vue'

const API_BASE = 'http://192.168.64.2:5000'

const hoy = new Date().toISOString().slice(0, 10)

const form = ref({
    fecha_del_hecho: '',
    dia_de_la_semana: '',
    hora_del_hecho: '',
    comuna_corregimiento: '',
    tipo_de_via_de_hechos: '',
    clase_de_accidente: '',
    genero: '',
    edad: null as number | null,
    caracteristicas_de_la_victima: '',
    vehiculo_de_la_victima: '',
    vehiculo_2_de_la_contraparte: '',
    vehiculo_3_de_la_contraparte: '',
    vehiculo_4_de_la_contraparte: ''
})

// 🔁 estado para editar
const isEditing = ref(false)
const editingId = ref<number | null>(null)

// Opciones de selects (igual que antes)
const opcionesComuna = [
    { label: 'Comuna 1', value: '1' },
    { label: 'Comuna 2', value: '2' },
    { label: 'Comuna 3', value: '3' },
    { label: 'Comuna 4', value: '4' },
    { label: 'Comuna 5', value: '5' },
    { label: 'Comuna 6', value: '6' },
    { label: 'Comuna 7', value: '7' },
    { label: 'Comuna 8', value: '8' },
    { label: 'Comuna 9', value: '9' },
    { label: 'Comuna 10', value: '10' },
    { label: 'El Caguán', value: 'El Caguán' },
    { label: 'Guacirco', value: 'Guacirco' },
    { label: 'Chapinero', value: 'Chapinero' },
    { label: 'Vegalarga', value: 'Vegalarga' },
    { label: 'Ninguna', value: 'Ninguna' }
]

const opcionesClaseAccidente = [
  { label: "Colisión con objeto móvil", value: "Colisión con objeto móvil" },
  { label: "Colisión con objeto fijo", value: "Colisión con objeto fijo" },
  { label: "Peatón atropellado", value: "Peatón atropellado" },
  { label: "Volcamiento", value: "Volcamiento" },
  { label: "Sin dato", value: "Sin dato" },
  { label: "Caída de ocupante", value: "Caída de ocupante" },
  { label: "Ciclista atropellado", value: "Ciclista atropellado" },
  { label: "Otra clase de accidente", value: "Otra clase de accidente" },
  { label: "Choque", value: "Choque" },
  { label: "No reportada", value: "No reportada" },
  { label: "Colisión con animales", value: "Colisión con animales" },
  { label: "Colisión", value: "Colisión" }
];


const opcionesCaracteristicaVictima = [
    'Peatón',
    'Ciclista',
    'Motociclista',
    'Pasajero moto',
    'Conductor automóvil',
    'Conductor bus',
    'Pasajero bus',
    'Conductor camión pequeño',
    'Conductor camión grande',
    'Pasajero camión',
    'Otro'
]

const opcionesVehiculo = [
    'Ninguno',
    'A pie',
    'Peatón',
    'Bicicleta',
    'Motocicleta',
    'Conductor moto',
    'Motocarro',
    'Automóvil',
    'Taxi',
    'Bus',
    'Buseta',
    'Camioneta',
    'Camión pequeño',
    'Camión grande',
    'Tractocamión',
    'Otro',
    'No aplica',
    'Sin dato'
]

// Día de la semana automático
watch(
    () => form.value.fecha_del_hecho,
    (nuevaFecha) => {
        if (!nuevaFecha) {
            form.value.dia_de_la_semana = ''
            return
        }
        form.value.dia_de_la_semana = calcularDiaSemana(nuevaFecha)
    }
)

function calcularDiaSemana(fechaStr: string): string {
    const [year, month, day] = fechaStr.split('-').map(Number)
    const date = new Date(year, month - 1, day)
    const nombres = [
        'Domingo',
        'Lunes',
        'Martes',
        'Miércoles',
        'Jueves',
        'Viernes',
        'Sábado'
    ]
    return nombres[date.getDay()]
}

const emit = defineEmits<{
    (e: 'guardado'): void
    (e: 'cancelar'): void
}>()

const isShowModal = ref(false)

function open() {
    // modo CREAR
    isEditing.value = false
    editingId.value = null
    limpiarFormulario()
    isShowModal.value = true
}
function toInputDate(raw: string | null | undefined): string {
  if (!raw) return ''

  // Caso 1: "2012-01-25T18:45:00" (ISO)
  if (/^\d{4}-\d{2}-\d{2}/.test(raw)) {
    return raw.slice(0, 10) // yyyy-mm-dd
  }

  // Caso 2: "25/01/2012, 06:45:00 p. m."
  const m = /^(\d{2})\/(\d{2})\/(\d{4})/.exec(raw)
  if (m) {
    const [_, dd, mm, yyyy] = m
    return `${yyyy}-${mm}-${dd}` // yyyy-mm-dd
  }

  return ''
}

function toInputTime(raw: string | null | undefined): string {
  if (!raw) return ''

  // Caso 1: "2012-01-25T18:45:00"
  const isoMatch = /T(\d{2}):(\d{2})/.exec(raw)
  if (isoMatch) {
    const [_, hh, mm] = isoMatch
    return `${hh}:${mm}`
  }

  // Caso 2: "25/01/2012, 06:45:00 p. m."
  const hMatch = /(\d{1,2}):(\d{2})/.exec(raw)
  if (hMatch) {
    const [_, hh, mm] = hMatch
    return `${hh.padStart(2, '0')}:${mm}`
  }

  return ''
}

function mapComunaToValue(raw: string | null | undefined): string {
  if (!raw) return ''

  // "Comuna 1" -> "1"
  const m = /Comuna\s+(\d+)/i.exec(raw)
  if (m) return m[1]

  // Para corregimientos ("El Caguán", etc.) lo dejamos igual
  return raw
}
//  abrir en modo EDICIÓN con datos de la fila
function openForEdit(item: any) {
  console.log('Editando item:', item)

  isEditing.value = true
  editingId.value = item.id

  const fuenteFecha = item.FechayHoradelHecho || item.Fechas30 || item.FechaISO

  form.value.fecha_del_hecho = toInputDate(fuenteFecha)
  form.value.hora_del_hecho = toInputTime(fuenteFecha)
  // Día de la semana -> "Miércoles"
  form.value.dia_de_la_semana = item.DiadelHecho || ''

  form.value.comuna_corregimiento = mapComunaToValue(item.ComunaCorregimiento || '')


  // Tipo de vía
  form.value.tipo_de_via_de_hechos =
    item.Tipodevia || ''

  // Clase de accidente
  form.value.clase_de_accidente =
    item.Clasedeaccidente || ''

  // Género
  form.value.genero =
    item.Genero || ''

  // Edad
  form.value.edad =
    item.Edad ?? null

  // Características de la víctima
  form.value.caracteristicas_de_la_victima =
    item.Caracteristicasdelavictima || ''

  // Vehículo víctima
  form.value.vehiculo_de_la_victima =
    item.Vehiculodelavictima || ''

  // Vehículos vinculados
  form.value.vehiculo_2_de_la_contraparte =
    item.Vehiculovinculado1 || ''

  form.value.vehiculo_3_de_la_contraparte =
    item.Vehiculovinculado2 || ''

  form.value.vehiculo_4_de_la_contraparte =
    item.Vehiculovinculado3 || ''

  isShowModal.value = true
}


function closeModal() {
    isShowModal.value = false
}

const limpiarFormulario = () => {
    Object.assign(form.value, {
        fecha_del_hecho: '',
        dia_de_la_semana: '',
        hora_del_hecho: '',
        comuna_corregimiento: '',
        tipo_de_via_de_hechos: '',
        clase_de_accidente: '',
        genero: '',
        edad: null,
        caracteristicas_de_la_victima: '',
        vehiculo_de_la_victima: '',
        vehiculo_2_de_la_contraparte: '',
        vehiculo_3_de_la_contraparte: '',
        vehiculo_4_de_la_contraparte: ''
    })
}

function onCancel() {
    limpiarFormulario()
    emit('cancelar')
}

async function guardarAccidente() {
    try {
        if (form.value.fecha_del_hecho > hoy) {
            alert('La fecha del hecho no puede ser mayor a la fecha actual.')
            return
        }

        const payload = {
            ...form.value,
            edad: form.value.edad ?? null
        }

        let url = `${API_BASE}/api/accidentes`
        let method: 'POST' | 'PUT' = 'POST'

        if (isEditing.value && editingId.value !== null) {
            url = `${API_BASE}/api/accidentes/${editingId.value}`
            method = 'PUT'
        }

        const r = await fetch(url, {
            method,
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify(payload),
            credentials: 'include' // si tu API requiere cookies/sesión
        })

        if (!r.ok) {
            throw new Error(`HTTP ${r.status}`)
        }

        const res = await r.json()
        console.log('Accidente guardado:', res)

        alert(
            isEditing.value
                ? 'Registro actualizado exitosamente'
                : 'Registro guardado exitosamente'
        )

        emit('guardado')
        closeModal()
        limpiarFormulario()
    } catch (error) {
        console.error('Error guardando accidente:', error)
        alert('Ocurrió un error al guardar el registro.')
    }
}

defineExpose({
    open,
    openForEdit
})
</script>
