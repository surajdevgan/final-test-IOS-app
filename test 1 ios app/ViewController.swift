//
//  ViewController.swift
//  test 1 ios app
//
//  Created by Sukhjeet Singh and Suraj Devgan on 08/03/21.

import UIKit

//we must let the class inherit from these 2 classes for implementing the pickerview
class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    var qualifications = ["High School","Diploma","Bachelor"]
    var languages = ["Java","C#","Swift","PHP","Python","R","Javascript"]
    
    var selectedQualification = ""
    
    //to store the value of total salary
    var totalSalary = 0
    
    var selectedLanguage = ""
   
    //to store the number of kids selected by user
    var totalKids = 0
    
    //to store the amount respective to no. of kids selected
    var kidsSalary = 0
    
    //to store the amount as per the years of experience
    var experienceSalary = 0
    
    
    //this function determines the number of columns in the pickerview
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        
        return 1
    }
    
    
    //this function determines the number of rows in the pickerView
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        //when we have more than 1 pickerview we should use if to know which one we are talking about
        if pickerView == higherQualification{
            return qualifications.count
        }
        else {
            
            return languages.count
            
        }
    }
    
    //shows the contents of the pickerview selected
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if pickerView == higherQualification{
            return qualifications[row]
        }
        
       else
        {
            return languages[row]
            
        }
        
        
    }
    
    //this function works when user selects a particular value from the pickerview
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if pickerView == higherQualification{
        
            selectedQualification = qualifications[row]
            
        }
        
        else if pickerView == languagesType{
            
            selectedLanguage = languages[row]
        }
    }
    
    //stepper to calculate no. of years of experience
    @IBOutlet weak var stepperlabel: UIStepper!
    
    @IBOutlet weak var havekidslabel: UILabel!
    @IBOutlet weak var havekidsno: UILabel!
    @IBOutlet weak var havekids: UILabel!
    
    @IBOutlet weak var havekidsyes: UILabel!
    
    @IBOutlet weak var noKids: UIButton!
    
    @IBOutlet weak var yesKids: UIButton!
    
    @IBOutlet weak var finalSalary: UILabel!
    @IBOutlet weak var experienceSlider: UILabel!
    @IBOutlet weak var numberofkids: UILabel! // no of kids label
    @IBOutlet weak var higherQualification: UIPickerView!
    
    @IBOutlet weak var languagesType: UIPickerView!
    @IBOutlet weak var Married: UIButton!
    @IBOutlet weak var Single: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        higherQualification.dataSource = self
        higherQualification.delegate = self
        
        languagesType.dataSource = self
        languagesType.delegate = self
    }
    
    
    //this function gets called when the user click on married radiobutton
    @IBAction func MarriedClick(_ sender: Any) {
        
        Married.isSelected = true
        Single.isSelected = false
        
        noKids.isHidden = false
        yesKids.isHidden = false
        havekids.isHidden = false
        havekidsno.isHidden = false
        havekidsyes.isHidden = false
    
    }
    
    //this function gets called when the user click on single radiobutton
    @IBAction func SingleClick(_ sender: Any) {
        
        Married.isSelected = false
        Single.isSelected = true
        
        noKids.isHidden = true
        yesKids.isHidden = true
        havekids.isHidden = true
        havekidsno.isHidden = true
        havekidsyes.isHidden = true
        havekidslabel.isHidden = true
        numberofkids.isHidden = true
        stepperlabel.isHidden = true
        kidsSalary = 0
    }
    
    //this function gets called when the user have kids
    @IBAction func yeskidsClick(_ sender: Any) {
        yesKids.isSelected = true
        noKids.isSelected = false
        
        havekidslabel.isHidden = false
        numberofkids.isHidden = false
        stepperlabel.isHidden = false
        
        
        
    }
    
    //this function gets called when the user dont have any kids
    @IBAction func nokidsClick(_ sender: Any) {
        yesKids.isSelected = false
        noKids.isSelected = true
        havekidslabel.isHidden = true
        numberofkids.isHidden = true
        stepperlabel.isHidden = true
        
    }
    
    //this function calculates salary in accordance with the number of kids selected
    @IBAction func stepper(_ sender: UIStepper) {
        numberofkids.text = String(Int(sender.value))
        kidsSalary = (Int(numberofkids.text!))! * 7000
    
        
    }
    
    //this function calculates salary in accordance with the number of years of experience selected
    @IBAction func slider(_ sender: UISlider) {
        experienceSlider.text = String(Int(sender.value))
        
        if Int(sender.value) >= 3{
            experienceSalary = (Int(experienceSlider.text!))! + 10000 - Int(sender.value)
        }
        
    }
    
    //this function calculates the estimated salary
    @IBAction func CalculateSalaryClick(_ sender: Any) {
        
   
        
        if selectedQualification == "Diploma"
        {
            totalSalary = 47000
            finalSalary.text = String(totalSalary)
        }
        
        else if selectedQualification == "Bachelor"
        {
            totalSalary = 55000
            finalSalary.text = String(totalSalary)
        }
        
        
        else if selectedQualification == "High School"
        {
            
            totalSalary = 40000
            finalSalary.text = String(totalSalary)
        }
        if selectedLanguage == "Java"        {
            totalSalary = totalSalary+3000
            finalSalary.text = String(totalSalary)
        }
        if selectedLanguage == "C#"        {
            totalSalary = totalSalary+3000
            finalSalary.text = String(totalSalary)
        }
        if selectedLanguage == "Javascript"        {
            totalSalary = totalSalary+3000
            finalSalary.text = String(totalSalary)
        }
        if selectedLanguage == "PHP"        {
            totalSalary = totalSalary+3000
            finalSalary.text = String(totalSalary)
        }
        if selectedLanguage == "Swift"        {
            totalSalary = totalSalary+5000
            finalSalary.text = String(totalSalary)
        }
        if selectedLanguage == "Python"        {
            totalSalary = totalSalary+5000
            finalSalary.text = String(totalSalary)
        }
        if selectedLanguage == "R"        {
            totalSalary = totalSalary+5000
            finalSalary.text = String(totalSalary)
        }
        
//displayin the final estimated salary
finalSalary.text = String(totalSalary+kidsSalary+experienceSalary)
    
    }
}

