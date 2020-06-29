function addPorcaoRef() {
    var mSec = new Date().getTime();

    idQuantidade = "alimento_porcoes_referencia_attributes_0_quantidade"
        .replace("0", mSec);
    nameQuantidade = "alimento[porcoes_referencia_attributes][0][quantidade]"
        .replace("0", mSec);
    idUnidade = "alimento_porcoes_referencia_attributes_0_unidade"
        .replace("0", mSec)
    nameUnidade = "alimento[porcoes_referencia_attributes][0][unidade]"
        .replace("0", mSec);

    var row = document.createElement("div");
    row.setAttribute("id", "row_" + mSec);
    row.setAttribute("class", "row");
    row.setAttribute("data-saved", "false");

    var colQuantidade = document.createElement("div");
    colQuantidade.setAttribute("class", "col-3");
    var formGroupQuantidade = document.createElement("div");
    formGroupQuantidade.setAttribute("class", "form-group");
    var labelQuantidade = document.createElement("label");
    labelQuantidade.setAttribute("for", idQuantidade);
    labelQuantidade.setAttribute("class", "required");
    var labelQuantidadeText = document.createTextNode("Porção de referência");
    labelQuantidade.appendChild(labelQuantidadeText);
    formGroupQuantidade.appendChild(labelQuantidade);
    var inputQuantidade = document.createElement("input");
    inputQuantidade.setAttribute("type", "text");
    inputQuantidade.setAttribute("id", idQuantidade);
    inputQuantidade.setAttribute("name", nameQuantidade);
    inputQuantidade.setAttribute("class", "form-control");
    inputQuantidade.addEventListener("input", function () {
        verificaUltimaPorcao();
    });
    formGroupQuantidade.appendChild(inputQuantidade);
    colQuantidade.appendChild(formGroupQuantidade);
    row.appendChild(colQuantidade);

    var colUnidade = document.createElement("div");
    colUnidade.setAttribute("class", "col-3");
    var div = document.createElement("div");
    div.setAttribute("class", "d-flex flex-row");
    var formGroupUnidade = document.createElement("div");
    formGroupUnidade.setAttribute("class", "form-group");
    var labelUnidade = document.createElement("label");
    labelUnidade.setAttribute("for", idUnidade);
    labelUnidade.setAttribute("class", "required");
    var labelUnidadeText = document.createTextNode("Unidade de medida");
    labelUnidade.appendChild(labelUnidadeText);
    formGroupUnidade.appendChild(labelUnidade);
    var inputUnidade = document.createElement("input");
    inputUnidade.setAttribute("type", "text");
    inputUnidade.setAttribute("id", idUnidade);
    inputUnidade.setAttribute("name", nameUnidade);
    inputUnidade.setAttribute("class", "form-control col-10");
    inputUnidade.setAttribute("placeholder", "g, kg, fatia, pedaço etc.");
    inputUnidade.addEventListener("input", function() {
        verificaUltimaPorcao();
    });
    div.appendChild(inputUnidade);
    formGroupUnidade.appendChild(div);
    colUnidade.appendChild(formGroupUnidade);
    row.appendChild(colUnidade);

    document.getElementById("porcoes_referencia").appendChild(row);
}

function addBotaoRemover(row) {
    var botaoRemover = document.createElement("button");
    botaoRemover.setAttribute("data-id", row.getAttribute("id"));
    botaoRemover.setAttribute("type", "button");
    botaoRemover.setAttribute("class", "close ml-auto");
    botaoRemover.addEventListener("click", function() {
        removePorcao($(this)[0]);
    });
    var spanRemover = document.createElement("span");
    spanRemover.innerHTML = "&times;";
    botaoRemover.appendChild(spanRemover);

    var div = row.getElementsByClassName("d-flex flex-row")[0];
    div.appendChild(botaoRemover);
}

function verificaUltimaPorcao() {
    var porcoesRef = document.getElementById("porcoes_referencia");
    var rows = porcoesRef.getElementsByClassName("row");
    var lastRow = rows[rows.length - 1];
    var inputQuantidade = lastRow.children[0].getElementsByTagName("input")[0];
    var inputUnidade = lastRow.children[1].getElementsByTagName("input")[0];

    if (!inputQuantidade.value.trim() == '' && !inputUnidade.value.trim() == '') {
        if (lastRow.getAttribute("data-saved") == "false")
            addBotaoRemover(lastRow);

        addPorcaoRef();
    }
}

function removePorcao(botao) {
    var row = document.getElementById(botao.getAttribute("data-id"));
    row.remove();
}

function fixRowLayout(row) {
    row.setAttribute("id", "row_" + new Date().getTime());
    var lastInput = row.getElementsByTagName("input")[1];
    var formGroup = lastInput.parentElement;
    var div = document.createElement("div");
    div.setAttribute("class", "d-flex flex-row");
    div.appendChild(lastInput);
    formGroup.appendChild(div);
}
