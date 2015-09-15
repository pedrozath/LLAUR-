class Contact < ActiveRecord::Base
	attr_accessible :name, :email, :message, 
	:medidas_por_dentro, :medidas_frente_do_braco, 
	:medidas_profundidade, :incluir_medidas, :attachment
	
	attr_accessor :medidas_por_dentro
	attr_accessor :medidas_frente_do_braco
	attr_accessor :medidas_profundidade
	attr_accessor :incluir_medidas
	attr_accessor :attachment
end
