<template>
    <fwb-modal v-if="isShowModal" @close="handleClose" size="md">
        <template #header>
            <div class="flex items-center font-bold text-lg">
                Inicio de sesión
            </div>
        </template>

        <template #body>
            <div class="space-y-4">
                <p class="text-sm text-gray-600">
                    Inicia sesión para poder agregar, editar o eliminar registros.
                    También puedes ingresar como invitado (solo lectura).
                </p>

                <!-- Mensaje de error -->
                <fwb-alert v-if="loginError" type="danger" class="mb-2" closable @dismissed="loginError = ''">
                    {{ loginError }}
                </fwb-alert>

                <div>
                    <label class="block mb-1 text-sm font-medium">Correo electrónico</label>
                    <input type="email" v-model="email" class="w-full border-2 rounded px-2 py-1"
                        placeholder="usuario@ejemplo.com" required />
                </div>

                <div>
                    <label class="block mb-1 text-sm font-medium">Contraseña</label>
                    <input type="password" v-model="password" class="w-full border-2 rounded px-2 py-1"
                        placeholder="••••••••" required />
                </div>
            </div>
        </template>

        <template #footer>
            <div class="flex justify-between w-full">
                <fwb-button type="button" color="light" @click="ingresarInvitado">
                    Ingresar como invitado
                </fwb-button>

               
                    <fwb-button type="button" color="green" :disabled="loading" @click="iniciarSesion">
                        {{ loading ? 'Iniciando...' : 'Iniciar sesión' }}
                    </fwb-button>
                
            </div>
        </template>
    </fwb-modal>
</template>

<script setup lang="ts">
import { ref, onMounted, defineExpose } from 'vue'
import { FwbModal, FwbButton, FwbAlert } from 'flowbite-vue'

const API_BASE = 'http://192.168.64.2:5000'

const isShowModal = ref(false)
const email = ref('')
const password = ref('')
const loginError = ref('')
const loading = ref(false)

const emit = defineEmits<{
    (e: 'login-success', user: any): void
    (e: 'guest'): void
}>()

// Se abre al iniciar el proyecto
onMounted(() => {
    isShowModal.value = true
})

function open() {
    isShowModal.value = true
}

function handleClose() {
    // si quieres que siempre haya alguien logueado, puedes impedir cerrar sin login
    isShowModal.value = false
}

async function iniciarSesion() {
    loginError.value = ''

    if (!email.value || !password.value) {
        loginError.value = 'Debe ingresar correo y contraseña.'
        return
    }

    loading.value = true
    try {
        const r = await fetch(`${API_BASE}/api/login`, {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify({
    email: email.value,
    password: password.value
}),

            credentials: 'include'   // 🔥 obligatorio
        })


        if (r.status === 404) {
            loginError.value = 'El correo electrónico no está registrado.'
            return
        }
        if (r.status === 401) {
            loginError.value = 'La contraseña es incorrecta.'
            return
        }
        if (!r.ok) {
            loginError.value = 'Ocurrió un error al iniciar sesión.'
            return
        }

        const data = await r.json()
        // data.user puede traer id, email, rol, etc.
        emit('login-success', data.user)
        isShowModal.value = false
    } catch (err) {
        console.error('Error en login:', err)
        loginError.value = 'No se pudo conectar con el servidor.'
    } finally {
        loading.value = false
    }
}

function ingresarInvitado() {
    // invitado = solo lectura
    emit('guest')
    isShowModal.value = false
}

defineExpose({
    open
})
</script>
