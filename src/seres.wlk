import territorios.*

class Ser {
	method habilidad()
	method adquirirExperiencia()
	method esInmortal()
	method esTorpe() = self.habilidad() < 1000
	method suenioProfundo()
	method estaConforme(terriotorio)
	method tomarRecursos(territorio)
}


class Elfo inherits Ser {
	var canciones = 20
	
	override method esInmortal() = true
	
	method canciones() = canciones
	
	override method habilidad()=
		if (canciones <= 60) 180 else canciones * 3
	
	override method adquirirExperiencia() {
		canciones *= 2
	}
	
	override method suenioProfundo(){
		canciones= 0.max(canciones - 10)
	}
	
	override method estaConforme(territorio)=
		territorio.lembas() >=8 
		
	override method tomarRecursos(territorio) {
		territorio.lembas(-3)
		canciones += 15
	}
}

class Hobbit inherits Ser {
	var amigos = 40
	var historias = 6
	
	method amigos() = amigos
	
	override method habilidad() = 
		if (amigos < 60) historias * 100 else historias * 50
	
	override method adquirirExperiencia() {
		amigos += 8
	}
	
	method organizarFiesta() {
		amigos += 5
		historias += 5
	}
	
	override method esInmortal() = amigos > 20
	
	override method suenioProfundo(){
		amigos= 0.max(amigos - 3)
	}
	
	override method estaConforme(territorio) =
		territorio.seresConHabilidadesMayoresA(self.habilidad()).size() <= 2

	override method tomarRecursos(territorio) {
		territorio.tabaco(-4)
		amigos += 7
		historias += 7
	}
}

class Enano inherits Ser{
	var ira = 200
	method ira() = ira
	override method esInmortal() = false
	override method habilidad() = ira * 2
	override method adquirirExperiencia() {
		ira += 300
	}
	override method suenioProfundo(){
		ira = 0.max(ira-50)
	}
	method equilibrarse(){
		if(self.habilidad() <= 700){
			self.adquirirExperiencia()
		}
		else{
			self.suenioProfundo()
		}
	}
	override method estaConforme(territorio) {
		const torpes = territorio.seresTorpes()
		return torpes.size() <=1 && not torpes.contains(self)
	}
	
	override method tomarRecursos(territorio) {}
				
}

class ElfoSivano inherits Elfo {
	override method habilidad() = super() + 400
}

class EnanoHerrero inherits Enano {
	var espadas = 3
	override method habilidad() =  100 * espadas
	override method adquirirExperiencia() {
		super()
		espadas += 1
	}
}

class EnanoFurioso inherits Enano{
	var property topeDeHabilidad = 2000
	
	override method habilidad(){
		return 0.max(super().min(topeDeHabilidad))
	}
}

class EnanoMinero inherits Enano{
	const escondites = #{}
	
	method agregarEscondite(unEscondite){
		escondites.add(unEscondite)
	}
	override method adquirirExperiencia() {
		super()
		self.agregarEscondite(new Escondite())
	}
	
	override method suenioProfundo(){
		if(escondites.size() > 2)
			escondites.forEach{e => e.agregarCandado()}
		else
			super()
	}
	
	override method ira() = ira + self.valorDeLosEcondites()
	
	method valorDeLosEcondites() = escondites.sum{e => e.valorDelEscondite() + 20}
}



class Escondite{
	var candados = 5
	var oro = 3
	
	method valorDelEscondite() = candados*oro
	
	method cantidadDeOro() = oro
	
	method cantidadDeCandados() = candados
	
	method agregarCandado(){
		candados++
	}
	
	method agregar_UnidadesDeOro(unNumero){
		oro += unNumero
	}
	
}
