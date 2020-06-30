module MetasHelper
  def energia_prog(meta, refeicoes)
    energia = 0.0

    refeicoes.each do |ref|
      energia += ref.energia
    end

    return energia, meta.energia
  end

  def carb_prog(meta, refeicoes)
    carb = 0.0

    refeicoes.each do |ref|
      carb += ref.carb
    end

    return carb, meta.carb_total
  end

  def proteina_prog(meta, refeicoes)
    prot = 0.0

    refeicoes.each do |ref|
      prot += ref.prot
    end

    return prot, meta.proteina
  end

  def gord_prog(meta, refeicoes)
    gord = 0.0

    refeicoes.each do |ref|
      gord += ref.gord
    end

    return gord, meta.gord_total
  end
end
