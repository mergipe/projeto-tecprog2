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
    row.setAttribute("class", "row");

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
    inputUnidade.setAttribute("class", "form-control");
    inputUnidade.setAttribute("placeholder", "g, kg, fatia, pedaço etc.");
    inputUnidade.addEventListener("input", function() {
        verificaUltimaPorcao();
    });
    formGroupUnidade.appendChild(inputUnidade);
    colUnidade.appendChild(formGroupUnidade);
    row.appendChild(colUnidade);

    var colRemover = document.createElement("div");
    colRemover.setAttribute("class", "col-1 d-flex align-items-center");
    var botaoRemover = document.createElement("button");
    botaoRemover.setAttribute("type", "button");
    botaoRemover.setAttribute("class", "close mt-3");
    botaoRemover.setAttribute("data-saved", "false");
    botaoRemover.addEventListener("click", function() {
        removePorcao($(this)[0]);
    });
    var spanRemover = document.createElement("span");
    spanRemover.innerHTML = "&times;";
    botaoRemover.appendChild(spanRemover);
    colRemover.appendChild(botaoRemover);
    row.appendChild(colRemover);

    document.getElementById("porcoes_referencia").appendChild(row);
}

function verificaUltimaPorcao() {
    var porcoesRef = document.getElementById("porcoes_referencia");
    var rows = porcoesRef.getElementsByClassName("row");
    var lastRow = rows[rows.length - 1];
    var inputQuantidade = lastRow.children[0].getElementsByTagName("input")[0];
    var inputUnidade = lastRow.children[1].getElementsByTagName("input")[0];

    if (!inputQuantidade.value.trim() == '' && !inputUnidade.value.trim() == '') {
        addPorcaoRef();
    }
}

function removePorcao(botao) {
    var row = botao.parentElement.parentElement;

    if (botao.getAttribute("data-saved") == "true") {
        var checkbox = row.getElementsByClassName("form-check-input")[0];
        checkbox.checked = true;
    }

    row.style.display = 'none';
}
