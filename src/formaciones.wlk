import vagones.*

class Formacion	 {
	const property vagones = []
	
	method cantPasajeros(){return
		vagones.sum({v=>v.capacidadPasajeros()})
	}
	method vagonesPopulares(){return
		vagones.count({v=>v.capacidadPasajeros() > 50})
	}
	method esformacionCarguera(){return
		vagones.all({v=>v.cantMaximaDeCarga()>=1000})
	}
	
	method vagonMasPesado() = vagones.max({v=>v.pesoMaximo()}).pesoMaximo()
	method vagonMasLiviano() = vagones.min({v=>v.pesoMaximo()}).pesoMaximo()
	method dispersionDePeso(){return
		self.vagonMasPesado() - self.vagonMasLiviano()
	}
	method cantidadBanios(){return
		vagones.count({v=>v.tieneBanio()})
	}
	method hacerMantenimiento(){
		vagones.forEach({v=>v.hacerMantenimiento()})
	}
	method vagonesDePasajeros(){return
		vagones.filter({v=>v.capacidadPasajeros()>0})
	}
	method vagonConMasPasajeros(){return
		self.vagonesDePasajeros().max({v=>v.capacidadPasajeros()})
	}
	method vagonConMenosPasajeros(){return
		self.vagonesDePasajeros().min({v=>v.capacidadPasajeros()})
	}
	method estaEquilibradaPasajeros(){return
		not self.vagonesDePasajeros().isEmpty() and 
		self.vagonConMasPasajeros().capacidadPasajeros() - self.vagonConMenosPasajeros().capacidadPasajeros() <= 20
	}
	method estaOrganizada(){
		
	}
}
