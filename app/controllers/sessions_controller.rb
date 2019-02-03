class SessionsController < ApplicationController

    # before_action :get_session, only: [:show, :index, :create]

    def index
        @sessions = Session.all
    end

    def new
        @session = Session.new
        @price_tables = PriceTable.all
    end

    def create
        @session = Session.new(session_params)
        @session.save
        if @session.persisted?
            redirect_to sessions_path, notice: "Session successfully created"
        else
            binding.pry
            render "new", notice: 'Every field needs to be filled in!'
        end
    end

    def show
        @session = Session.find(params[:id])
    end

    private

    def get_session
        @session = Session.find(params[:id])
    end

    def session_params
        params.permit(:title, :start_date, :price_table_id)
    end
end
