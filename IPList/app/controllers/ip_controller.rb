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
    
    render text: "IP addresses added to list!", content_type: 'text/plain'
  end

  def get
    item = params[:ip_address]

 
    if Ip.find_by_ip_address(item) == nil
      render nothing: true, status: 500
    else
      render text: item, content_type: 'text/plain'
    end
  end

  def all
    all_ips = Ip.all
    ip_list = []

    all_ips.each { |item| ip_list << item.ip_address}

    render json: ip_list, content_type: 'application/json'
  end

  def destroy
    Ip.delete_all unless Ip.all == nil

    render text: "All IP addresses deleted from list!", content_type: 'text/plain'
  end
end
