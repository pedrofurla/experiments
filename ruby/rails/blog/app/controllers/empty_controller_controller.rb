class EmptyControllerController < ApplicationController
  def show
    @post = Post.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @post }
    end
  end
  def save(upload) # It's a instance method only for convience, should really be class method
    name =  upload['datafile'].original_filename
    directory = "public/data"
    # create the file path
    path = File.join(directory, name)
    # write the file
    File.open(path, "wb") { |f| f.write(upload['datafile'].read) }
  end
  def upload
    post = save(params[:upload])
    render :text => "File has been uploaded successfully"
  end
end
