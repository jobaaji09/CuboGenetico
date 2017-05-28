namespace CuboGenetico{
	public class Corrector:GLib.Object{

		private GLib.Rand rand;
		
		public Corrector(int semilla){
			this.rand = new GLib.Rand();
			this.rand.set_seed(semilla);
		}

		public AGenetico.Genotipo reparaG(AGenetico.Genotipo gene){
			var len  = gene.genotipo.length;
			var ngene = new AGenetico.Genotipo(len);
			for(int i =0;i<len-1;i++){
				if(this.sonInv(gene.genotipo[i],gene.genotipo[i+1])){
					ngene.genotipo[i] = (int)this.rand.int_range(1,13);
				}else{
					ngene.genotipo[i] = gene.genotipo[i];
				}
				
			}
			ngene.genotipo[len-1] = gene.genotipo[len-1];
			return ngene;
		}


		private bool sonInv(int x, int y){
			bool inv = false;
			if((x == 1 && y ==2) || (x==2 && y == 1) ){
				inv = true;
			}else if((x == 3 && y ==4) || (x==4 && y == 3) ){
				inv = true;
			}else if((x == 5 && y ==6) || (x==6 && y == 5) ){
				inv = true;
			}else if((x == 7 && y ==8) || (x==8 && y == 7) ){
				inv = true;
			}else if((x == 9 && y ==10) || (x==10 && y == 9) ){
				inv = true;
			}else if((x == 11 && y ==12) || (x==12 && y == 11) ){
				inv = true;
			}
			return inv;
		}
	}

}