class DownloadsController < ApplicationController
  def download
    file_path = Rails.root.join('public', 'downloads', params[:filename])
    send_file file_path, disposition: 'attachment', filename: params[:filename]
  end
end
