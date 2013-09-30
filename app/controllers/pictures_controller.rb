class PicturesController < InheritedResources::Base
  before_filter :authenticate_user!, :except => ["index", "show"]
  def index
    @pictures = Picture.find_with_reputation(:votes, :all, order: "votes desc")

  end
  def show
    @picture = Picture.find(params[:id])

  end
  def new
    @picture = Picture.new
  end
  def create
    @picture = Picture.create(params[:picture])

    respond_to do |format|
      if @picture.save
        format.html { redirect_to @picture, :notice => 'Picture was successfully created.' }
        format.json { render :json => @picture, :status => :created, :location => @picture }
      else
        format.html { render :action => "new" }
        format.json { render :json => @picture.errors, :status => :unprocessable_entity }
    end
    end
  end

  def vote
    value = params[:type]  == "up" ? 1 : -1
    @picture = Picture.find(params[:id])
    @picture.add_or_update_evaluation(:votes, value, current_user )
    redirect_to :back, :notice => "thank you for voting"

  end

end
