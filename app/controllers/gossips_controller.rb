class GossipsController < ApplicationController
	def index # methode qui recupere tous le potins les envoie a la VIEW
  		@gossips = Gossip.all
  		@users = User.all
  	end

  # recupere le potin concerne et l'envoie a la veiw show(show.html.erb)
 	 def show
     @gossip = Gossip.find(params[:id])
    @users = User.all
  	
  	end

  # cree un potin vide et l'envoie a une VIEWqui affiche le formulaire pour  (le remplir new.html.erb)
  	def new
  	
  	end

 # Méthode qui créé un potin à partir du contenu du formulaire de new.html.erb, soumis par l'utilisateur   # pour info, le contenu de ce formulaire sera accessible dans le hash params (ton meilleur pote)
 # Une fois la création faite, on redirige généralement vers la méthode show (pour afficher le potin créé
 	def create
 	 @gossip = Gossip.new(title: params[:title], content: params[:content]) # 
    	if @gossip.save
        flash[:success] = "ok"
      		redirect_to root_path 

    	else
        flash[:danger] = "nop"
      	render new_gossip_path # l'utils reste sur la page 
    	end

 	end

 # Méthode qui récupère le potin concerné et l'envoie à la view edit (edit.html.erb) pour affichage dans un formulaire d'édition
 	def edit
    @gossip = Gossip.find(params[:id])
  		
 	end

 # Méthode qui met à jour le potin à partir du contenu du formulaire de edit.html.erb, soumis par l'utilisateur
 # pour info, le contenu de ce formulaire sera accessible dans le hash params
 # Une fois la modification faite, on redirige généralement vers la méthode show (pour afficher le potin modifié)
	def update
    @gossip = Gossip.find(params[:id])
    if @gossip.update(title: params[:title], content: params[:content])
      flash[:success] = "ok"
      redirect_to gossip_path
    else
      flash[:danger] = "nop"
      render edit_gossip_path
    end
  end
    	
 
 # Méthode qui récupère le potin concerné et le détruit en base
 # Une fois la suppression faite, on redirige généralement vers la méthode index (pour afficher la liste à jour)
	def destroy
       @gossip = Gossip.find(params[:id])
    if @gossip.destroy
      flash[:success] = "ok"
      redirect_to gossips_path
    else
      flash[:danger] = "nop"
      render gossip_path
    end
	
	end

end # class
