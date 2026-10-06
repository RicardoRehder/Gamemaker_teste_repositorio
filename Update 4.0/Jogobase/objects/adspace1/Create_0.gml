show_debug_message("A TRANSIÇÃO FOI CRIADA AQUI!");
show_debug_message(debug_get_callstack());
image_index = 0;
image_speed = 0;
image_index = 0;
image_speed = 0;

// --- MENSAGENS DO TUTORIAL ---
texto_tutorial[0] = "Aperte A e D para se mover para a Esquerda e Direita.";
texto_tutorial[1] = "Pressiona ESPAÇO para pular!";
texto_tutorial[2] = "Ótimo! Agora abra a porta com E";

// --- VARIÁVEIS DE CONTROLO ---

// --- EVENTO CREATE DO adspace1 ---

// 1. Array com as frases do tutorial
texto_tutorial = [
    "Usa A e D para andar.",
    "Pressiona ESPACO para pular.",
    "Chega perto do portal e aperta E para sair."
];

// 2. Estado inicial
etapa_tutorial = 0;

// 3. CARREGAR A PRIMEIRA FRASE (Sem isto o texto_completo fica vazio!)
texto_completo = texto_tutorial[etapa_tutorial];

// 4. Configuração do efeito de escrita
posicao_letra = 0;
velocidade_texto = 0.5;
texto_exibido = "";
tempo_espera = 0;