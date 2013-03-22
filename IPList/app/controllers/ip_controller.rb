class IpController < ApplicationController
  def add
    addresses = params[:_json]

    addresses.each do |item|
      if Ip.find_by_ip_address(item) == nil
        new_ip = Ip.new
        new_ip.ip_address = item
        new_ip.save
      end
    end

    respond_to do |format|
      format.text { render text: "IP addresses added to list!" }
    end
  end

  def get
    item = params[:ip_address]

    respond_to do |format|
      if Ip.find_by_ip_address(item) == nil
        format.any { render nothing: true, status: 500 }
      else
        format.text { render text: item }
      end
    end
  end

  def all
    all_ips = Ip.all
    ip_list = []

    all_ips.each { |item| ip_list << item.ip_address}

    respond_to do |format|
      format.json {render json: ip_list}
    end
  end

  def destroy
    Ip.delete_all unless Ip.all == nil

    respond_to do |format|
      format.text {render text: "All IP addresses deleted from list!"}
    end
  end
end
