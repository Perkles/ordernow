class OrdersController < ApplicationController

    $request_date = Date.today

    def index
        @orders = Order.where(data: $request_date)
    end

    def new
        @orders = Order.new
    end

    def create
        @orders = Order.new(orders_params)
        if @orders.save
            $request_date = @orders.data
            redirect_to orders_path
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
            $request_date = @orders.data
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
        if @orders.deliver == false
            @orders.deliver = true
            @orders.save
            redirect_to action: "index"
        else
        end
    end

    def tomorrow_order
        $request_date += 1.day
        redirect_to orders_path
    end

    def yesterday_order
        $request_date -= 1.day
        redirect_to orders_path
    end

    def today_order
        $request_date = Date.today
        redirect_to orders_path
    end

    private
        def orders_params
            params.require(:order).permit(:data, :description, :value)
        end
    

end
