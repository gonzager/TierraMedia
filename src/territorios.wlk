class Territorio {
	const seres = []
	var lembas = 10
	var tabaco = 10
	
	method agregarSeres(listaSeres) {
		seres.addAll(listaSeres)
	}

	method lembas()= lembas
	method lembas(cantidad) {
		lembas += cantidad
	}
	
	method tabaco() = tabaco
	method tabaco(cantidad) {
		tabaco += cantidad
	}

	
	method seresTorpes(){
		return seres.filter({ser => ser.esTorpe()})
	}
	
	method seresInmortales() {
		return seres.filter({ser => ser.esInmortal() })
	}
	
	method maximaHabilidadSeresInmortales() {
		return self.seresInmortales().max({
			ser => ser.habilidad()
		}).habilidad()
	}
	
	method habilidadTotal() {
		return seres.sum({ser => ser.habilidad()})
	}
	
	method promedioHabilidadTotal() {
		return self.habilidadTotal() / seres.size()
	}
	
	method esSabio() {
		return seres.all({ ser => ser.habilidad() > 300 })
	}
	
	method realizarTorneo() {
		return seres.forEach( { ser => ser.adquirirExperiencia() })
	}
	
	method epifania () {
		self.seresTorpes().forEach( { ser => ser.adquirirExperiencia() })
	}
	
	method haySerMortal() {
		return seres.any({ser => not ser.esInmortal()})
	}
	
	method habilidadEntre(desde, hasta) {
		return seres.filter({ser=>ser.habilidad().between(desde, hasta)})
	}
	
	method capitan() {
		return self.habilidadEntre(1000,3000).max({ser=> ser.habilidad()})
	}
	
	method somnolencia() {
		seres.forEach({ser=> ser.suenioProfundo()})
	}
	
	method estaEnPaz() {
		return seres.all({ ser => ser.estaConforme(self)})
	}
	
	method seresConHabilidadesMayoresA(habilidad) {
		return seres.filter({ser=>ser.habilidad()> habilidad})
	}
}


