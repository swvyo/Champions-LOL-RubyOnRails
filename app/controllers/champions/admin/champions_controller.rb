class Champions::Admin::ChampionsController < ApplicationController

    def load_all_champions 
        champions = Champion.order('created_at DESC')
        render(
            json:{
                status: 'SUCESS', message: 'Campeões carregados!', data: champions
            },
            status: :ok
        )
    end


    def create_champions
        champion = Champion.build_champion(
            name: params[:name],
            location: params[:location],
            masteries: params[:masteries],
            description: params[:description]
        )

        champion.save!

        render(json:{data:champion}, status: :ok)
    end

    def delete_champions
        champion = Champion.find_by(id: params[:id])
        champion.destroy
    end

    def update_champions
        champion = Champion.find_by(id: params[:id])
        champion.update(
            name: params[:name] ||  champion.name,
            location: params[:location] || champion.location,
            masteries: params[:masteries] || champion.move,
            description: params[:description] || champion.description 
        )

        render(json: {data:champion}, status: :ok)
    end
end