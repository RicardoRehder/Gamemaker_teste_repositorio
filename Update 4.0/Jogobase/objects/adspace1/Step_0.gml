// --- EVENTO STEP DO adspace1 ---

// Verificar o estado atual de cada tecla
image_speed = 0;
var _a     = keyboard_check(ord("A"));
var _d     = keyboard_check(ord("D"));
var _space = keyboard_check(vk_space);

// Atualizar o frame exato do sprite com base nas combinações
if (!_a && !_d && !_space)
{
    image_index = 0; // Nenhum pressionado
}
else if (_a && !_d && !_space)
{
    image_index = 1; // A
}
else if (!_a && _d && !_space)
{
    image_index = 2; // D
}
else if (!_a && !_d && _space)
{
    image_index = 3; // SPACE
}
else if (_a && _d && !_space)
{
    image_index = 4; // A + D
}
else if (_a && !_d && _space)
{
    image_index = 5; // A + SPACE
}
else if (!_a && _d && _space)
{
    image_index = 6; // D + SPACE
}
else if (_a && _d && _space)
{
    image_index = 7; // A + D + SPACE
}

// 1. Efeito Máquina de Escrever (adiciona letras gradualmente)
if (posicao_letra < string_length(texto_completo)) {
    posicao_letra += velocidade_texto;
    texto_exibido = string_copy(texto_completo, 1, floor(posicao_letra));
} 
else {
    // 2. Quando o texto termina de ser escrito, incrementa o tempo de espera
    tempo_espera++;
}

// 3. Avançar para a próxima mensagem no adspace1
if (posicao_letra >= string_length(texto_completo) && tempo_espera >= 30) {
    if (keyboard_check_pressed(vk_space) || keyboard_check_pressed(vk_enter)) {
        
        if (etapa_tutorial < array_length(texto_tutorial) - 1) {
            etapa_tutorial++;
            texto_completo = texto_tutorial[etapa_tutorial];
            texto_exibido = "";
            posicao_letra = 0;
            tempo_espera = 0;
        } 
        else {
            // Fim das mensagens: apaga o tutorial sem tocar na sala
            instance_destroy(); 
        }
    }
}



