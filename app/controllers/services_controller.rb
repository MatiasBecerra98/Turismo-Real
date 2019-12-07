class ServicesController < InheritedResources::Base

  private

    def service_params
      params.require(:service).permit(:name, :price, :status)
    end

end
