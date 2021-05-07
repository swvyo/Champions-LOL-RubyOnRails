class Champions::User::ChampionsController < ApplicationController

    def find_champion_by_name
        name = params[:name]

        champion = Champion.select(:id, :name, :location, :masteries, :description).find_by(name: name)

        render(json: { data: champion}, status: :ok)
    end

    def adquirir_campeao
        champion = load_champion
        champion_adquirido = ChampionAdquirido.find_by(champion: champion)

        if champion_adquirido.present?
            render(json:{data:{message: 'message'}})
            return
        end

        adquirido = ChampionAdquirido.create!(champion: champion)
        render(json:{ data: adquirido }, status: :ok)
    end

    def load_champions_adquiridos
        champion_adquirido = ChampionAdquirido.order('created_at DESC')

        render(json:{data: champion_adquirido}, status: :ok)

    end

    def load_champion_adquirido_by_name
        champion_adquirido = ChampionAdquirido
        .joins(:champion)
        .where(champions: {name: params[:name]})

        render(json:{data: champion_adquirido}, status: :ok)
    end


    private 

    def load_champion
        champion = Champion.find_by(id: params[:id])

        unless champion
            render(
                json:{error: {message: 'Campeão não existente em runeterra!'}},
                status: :not_found
            )
        end

        champion
    end
end