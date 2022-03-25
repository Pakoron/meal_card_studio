class PatientsController < ApplicationController
  before_action:login?
  # 患者一覧表示
  def index
    @patients = Patient.all.order(patientid: "ASC")
  end
  
  # 患者詳細ページ
  def show
    @patient = Patient.find(params[:id])
    # p @patient
  end
  
  # 新規作成
  def new
    @patient = Patient.new
  end
  
  #新規登録
  def create
    # Patientモデルを初期化
    @patient = Patient.new(patient_params)
    # PatientモデルをDBへ保存
    if @patient.save
    # showへリダイレクト
    redirect_to @patient,notice: '食札情報を登録しました'
    else
      render 'new', status: :unprocessable_entity
    end
  end
  #ユーザー詳細
  def userdata
  end
  # 編集
  def edit
    @patient = Patient.find(params[:id])
  end
  
  #更新
  def update
    @patient = Patient.find(params[:id])
    if @patient.update(patient_params)
      redirect_to @patient,notice: '食札情報を編集しました'
    else
      render 'edit', status: :unprocessable_entity
    end
  end
  
  # 削除
  def destroy
    @patient = Patient.find(params[:id])
    @patient.destroy
    # redirect_to patients_path
    redirect_to @patient, status: :see_other
  end
  
  private
  def patient_params
    params.require(:patient).permit(:name, :form, :disease, :staple, :allergy, :dislike, :comment,:patientid,:stapleweight)
  end
end
