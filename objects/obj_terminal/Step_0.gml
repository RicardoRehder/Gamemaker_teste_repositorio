if (!ativo)
{
    exit;
}

// Aguarda soltar E para evitar digitação indesejada
if (keyboard_check(ord("E")) && codigo_digitado == "")
{
    keyboard_string = "";
    exit;
}

// Fechar com ESC
if (keyboard_check_pressed(vk_escape))
{
    ativo = false;
    global.terminal_ativo = false;

    codigo_digitado = "";
    keyboard_string = "";

    exit;
}

// Capturar o texto digitado
codigo_digitado = keyboard_string;

// Executar com ENTER
if (keyboard_check_pressed(vk_enter))
{
    var _codigo = string_trim(codigo_digitado);

    if (_codigo != "")
    {
        processar_codigo_c(_codigo);
    }

    codigo_digitado = "";
    keyboard_string = "";
}

if(room == BossFight1) {
	
	global.terminal_ativo = true;
	ativo = true;
	
}