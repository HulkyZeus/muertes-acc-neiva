<template>
    <div class="py-6 mt-4">
        <h1 class="text-4xl font-bold mb-8">📊 Dashboard de Estadísticas de Accidentes (2012 - 2025)</h1>

        <div class="bg-white shadow-xl rounded-lg p-6 mb-8">
            <h2 class="text-xl font-semibold mb-4 border-b pb-2">Tendencia de Accidentes por Año</h2>

            <template v-if="loading.anio">
                <div class="text-center py-8">Cargando datos por año...</div>
            </template>
            <template v-else-if="error.anio">
                <div class="text-red-500">Error: {{ error.anio }}</div>
            </template>
            <template v-else-if="dataAnio.length > 0">
                <div class="relative h-64">
                    <LineChart :key="chartKeys.anio" :data="dataAnioChart" :options="chartOptions" />
                </div>

            </template>
            <template v-else>
                <div class="text-center py-8 text-gray-500">No hay datos de accidentes por año disponibles.</div>
            </template>
        </div>

        <div class="bg-white shadow-xl rounded-lg p-6 mb-8">
            <h2 class="text-xl font-semibold mb-4 border-b pb-2">Accidentes por Comuna - Top 10 </h2>

            <template v-if="loading.comuna">
                <div class="text-center py-8">Cargando datos por comuna...</div>
            </template>
            <template v-else-if="error.comuna">
                <div class="text-red-500">Error: {{ error.comuna }}</div>
            </template>
            <template v-else-if="dataComuna.length > 0">
                <div class="relative h-72">
                    <BarChart :key="chartKeys.comuna" :data="dataComunaChart" :options="chartOptions" />
                </div>

            </template>
            <template v-else>
                <div class="text-center py-8 text-gray-500">No hay datos de accidentes por comuna disponibles.</div>
            </template>
        </div>

        <div class="bg-white shadow-xl rounded-lg p-6 mb-8">
            <h2 class="text-xl font-semibold mb-4 border-b pb-2">Distribución por Clase de Accidente</h2>

            <template v-if="loading.clase">
                <div class="text-center py-8">Cargando datos por clase...</div>
            </template>
            <template v-else-if="error.clase">
                <div class="text-red-500">Error: {{ error.clase }}</div>
            </template>
            <template v-else-if="dataClase.length > 0">
        <div class="relative h-[600px]">
            <BarChart :key="chartKeys.clase" :data="dataClaseChart" :options="chartOptionsBarHorizontal" />
        </div>
    </template>
            <template v-else>
                <div class="text-center py-8 text-gray-500">No hay datos de clase de accidentes disponibles.</div>
            </template>
        </div>
    </div>
</template>
<script setup>
import { ref, onMounted, computed } from 'vue';
import { Line as LineChart, Bar as BarChart } from 'vue-chartjs';

// Importaciones necesarias para Chart.js
import {
  Chart as ChartJS,
  Title,
  Tooltip,
  Legend,
  BarElement,
  CategoryScale,
  LinearScale,
  PointElement,
  LineElement
} from 'chart.js';

ChartJS.register(
  Title, Tooltip, Legend,
  BarElement, CategoryScale, LinearScale,
  PointElement, LineElement
);

// --- CONFIGURACIÓN Y ESTADO ---
const API_BASE = 'http://127.0.0.1:5000/api/estadisticas';

const dataAnio = ref([]);
const dataComuna = ref([]);
const dataClase = ref([]);

const loading = ref({ anio: true, comuna: true, clase: true });
const error = ref({ anio: null, comuna: null, clase: null });

const chartKeys = ref({ anio: 0, comuna: 0, clase: 0 });

const chartOptions = {
  responsive: true,
  maintainAspectRatio: false,
};

// ⭐ NUEVAS OPCIONES PARA GRAFICO DE BARRAS HORIZONTALES
const chartOptionsBarHorizontal = {
  responsive: true,
  maintainAspectRatio: false,
  indexAxis: 'y', // 🔥 hace las barras horizontales
  plugins: {
    legend: { display: false },
    tooltip: {
      callbacks: {
        label: (ctx) => `${ctx.raw} accidentes`
      }
    }
  },
  scales: {
    x: {
      ticks: { color: '#444' },
      grid: { color: '#ddd' }
    },
    y: {
      ticks: { color: '#222' },
      grid: { display: false }
    }
  }
};

const COLORS = ['#0088FE', '#00C49F', '#FFBB28', '#FF8042', '#AF19FF', '#FF197C', '#FA8072', '#20B2AA'];

// --- FETCH GENERAL ---
const fetchData = async (endpoint, dataRef, key) => {
  loading.value[key] = true;
  error.value[key] = null;

  try {
    const r = await fetch(`${API_BASE}/${endpoint}`);
    if (!r.ok) throw new Error(`HTTP ${r.status}`);

    const datos = await r.json();
    dataRef.value = datos;
  } catch (err) {
    error.value[key] = `No se pudo conectar al servidor: ${err.message}`;
    dataRef.value = [];
  } finally {
    loading.value[key] = false;
    chartKeys.value[key]++;
  }
};

onMounted(() => {
  fetchData('por-anio', dataAnio, 'anio');
  fetchData('por-comuna', dataComuna, 'comuna');
  fetchData('por-clase-accidente', dataClase, 'clase');
});

// GRAFICO AÑO
const dataAnioChart = computed(() => {
  if (!dataAnio.value.length) return { labels: [], datasets: [] };
  return {
    labels: dataAnio.value.map(i => i.ano),
    datasets: [
      {
        label: 'Total de Accidentes',
        backgroundColor: '#8884d8',
        borderColor: '#8884d8',
        data: dataAnio.value.map(i => i.total),
        tension: 0.4,
      }
    ]
  };
});

// GRAFICO COMUNA
const dataComunaChart = computed(() => {
  if (!dataComuna.value.length) return { labels: [], datasets: [] };

  const top10 = [...dataComuna.value]
    .sort((a, b) => b.total - a.total)
    .slice(0, 10);

  return {
    labels: top10.map(i => i.comuna_corregimiento),
    datasets: [
      {
        label: 'Total de Accidentes',
        backgroundColor: '#4CAF50',
        data: top10.map(i => i.total),
      }
    ]
  };
});

// ⭐ GRAFICO CLASE - BARRAS HORIZONTALES
const dataClaseChart = computed(() => {
  if (!dataClase.value.length) return { labels: [], datasets: [] };

  return {
    labels: dataClase.value.map(item => item.clase_de_accidente),
    datasets: [
      {
        backgroundColor: dataClase.value.map((_, i) => COLORS[i % COLORS.length]),
        data: dataClase.value.map(item => item.total),
      }
    ]
  };
});
</script>


<style scoped>
</style>
