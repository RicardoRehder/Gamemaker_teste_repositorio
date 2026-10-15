function processar_codigo_c(_texto)
{
    _texto = string_trim(_texto);

    if (_texto == "int porta = 1;")
    {
        global.porta_liberada = true;
        desafio_resolvido = true;

        array_push(
            historico_terminal,
            "> " + _texto
        );

        array_push(
            historico_terminal,
            "SUCESSO: PORTA DESBLOQUEADA!"
        );
    }
    else
    {
        array_push(
            historico_terminal,
            "> " + _texto
        );

        array_push(
            historico_terminal,
            "ERRO: codigo incorreto."
        );

        array_push(
            historico_terminal,
            "Tente novamente."
        );
    }
}