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
    formGroupUnidade.appendChild(inputUnidade);

    colUnidade.appendChild(formGroupUnidade);
    row.appendChild(colUnidade);

    document.getElementById("porcoes_referencia").appendChild(row);
}
