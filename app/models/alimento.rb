class Alimento < ApplicationRecord
  def nome_completo
    if self.marca.empty?
      return self.nome
    else
      return self.nome + ' (' + self.marca + ')'
    end
  end
end
