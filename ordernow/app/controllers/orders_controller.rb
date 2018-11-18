class OrdersController < ApplicationController

    def index
        @orders = Order.all
    end

    def new
        @orders = Order.new
    end

    def create
        @orders = Order.new(orders_params)
        if @orders.save
            redirect_to @orders
        else
          render :new
        end
    end

    def show
        @orders = Order.find(params[:id])
    end

    def edit
        @orders = Order.find(params[:id])
    end

    def update
        @orders = Order.find(params[:id])
        if @orders.update(orders_params)
            redirect_to @orders
        else
          render :edit
        end
    end

    def destroy
        @orders = Order.find(params[:id])
        @orders.destroy

        redirect_to orders_path
    end

    def deliver
        @orders = Order.find(params[:id])
        p("kajsdhkadhjksadas34567890875")
        p(@orders)
        if @orders.deliver == false
            @orders.deliver = true
            @orders.save
            redirect_to action: "index"
        else
        end
    end

    private
        def orders_params
            params.require(:order).permit(:data, :description, :value)
        end

end
