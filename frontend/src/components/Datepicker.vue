<template>
    <div class="relative w-full z-10">
        <div class="absolute inset-y-0 start-0 flex items-center ps-3 pointer-events-none">
            <svg class="w-4 h-4 text-gray-500 dark:text-gray-400" aria-hidden="true" xmlns="http://www.w3.org/2000/svg"
                fill="currentColor" viewBox="0 0 20 20">
                <path
                    d="M20 4a2 2 0 0 0-2-2h-2V1a1 1 0 0 0-2 0v1h-3V1a1 1 0 0 0-2 0v1H6V1a1 1 0 0 0-2 0v1H2a2 2 0 0 0-2 2v2h20V4ZM0 18a2 2 0 0 0 2 2h16a2 2 0 0 0 2-2V8H0v10Zm5-8h10a1 1 0 0 1 0 2H5a1 1 0 0 1 0-2Z" />
            </svg>
        </div>

        <input 
            type="text" 
            :value="modelValue"  
            @input="handleInputChange"  maxlength="10"              class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full ps-10 p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
            placeholder="dd/mm/yyyy" 
        />
    </div>
</template>

<script setup>
import { defineProps, defineEmits } from 'vue';

const props = defineProps({
    modelValue: {
        type: String, 
        default: '',
    }
});

const emit = defineEmits(['update:modelValue']);

/**
 * Función que formatea la entrada del usuario a DD/MM/YYYY automáticamente.
 */
const handleInputChange = (event) => {
    const input = event.target;
    let value = input.value;
    
    // 1. Limpiar: Eliminar cualquier carácter que no sea un dígito numérico (0-9).
    // Esto asegura que solo queden los números que el usuario ha tecleado.
    let cleanedValue = value.replace(/[^\d]/g, '');

    // 2. Formatear: Insertar las barras en las posiciones correctas.
    let formattedValue = '';

    if (cleanedValue.length > 0) {
        // DD
        formattedValue += cleanedValue.substring(0, 2);
    }
    if (cleanedValue.length > 2) {
        // DD/MM
        formattedValue += '/' + cleanedValue.substring(2, 4);
    }
    if (cleanedValue.length > 4) {
        // DD/MM/YYYY
        formattedValue += '/' + cleanedValue.substring(4, 8);
    }

    // 3. Actualizar DOM y v-model:
    // Mantenemos el cursor al final de la entrada.
    input.value = formattedValue;
    emit('update:modelValue', formattedValue);
};
</script>