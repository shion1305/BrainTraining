import UIKit

class TimeCountChallenge: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    @IBOutlet weak var MessageField: UILabel!
    @IBOutlet weak var COUNT: UIButton!
    @IBOutlet weak var START: UIButton!
    @IBOutlet weak var StatusLabel: UILabel!
    @IBOutlet weak var DetailCollectionView: UICollectionView!
    internal var lasttime:Date!
    internal var SectionNumber : Int = 0
    internal var isRunning : Bool = false
    internal var time : Int = 0
    internal var Targets : Array<Double> = Array<Double>(repeating: 0, count: 10)
    var resultData : Array<Double> = Array(repeating: 0, count: 10)
    
    override func viewWillAppear(_ animated: Bool) {
        Targets = TargetSuggester()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //        COUNT.isHidden = true
        
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var TOPLABEL: UILabel!
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //スタートボタンを押した時
    @IBAction func Start(_ sender: UIButton) {
        if !isRunning {
            lasttime = Date()
            StatusLabel.text="1 / 10"
            TOPLABEL.text="計測中"
            isRunning=true;
            COUNT.isHidden=false;
            START.isHidden=true;
        }else{
            //MessageFieldに無効な操作の報告
        }
    }
    
    //ホームに戻るボタンを押した時
    @IBAction func BackToHome(_ sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
    }
    
    //記録ボタンを押した時
    @IBAction func COUNT(_ sender: Any) {
        if isRunning{
            TIMER()
            DetailCollectionView.reloadItems(at: [IndexPath.init(row: time, section: SectionNumber)])
            if time==9{
                COUNT.isHidden=true
                let next = self.storyboard!.instantiateViewController(withIdentifier: "TimeCountChallengeResult") as! TimeCountChallengeResultViewer
                var ResultArray = Array<Double>(repeating: 0, count: 20)
                for i in 0..<10{
                    ResultArray[2 * i] = Targets[i]
                    ResultArray[2 * i + 1] = resultData[i]
                }
                next.result = ResultArray
                present(next, animated: true, completion: nil)
            }else{
                StatusLabel.text = String(time + 2) + " / 10"
                time+=1
                
            }
        }
    }
    
    func TIMER(){
        let now = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "mm:ss.SSS"
        print(formatter.string(from: now))
        let result: Double = Double(now.timeIntervalSince(lasttime))
        lasttime = now
        resultData[time]=result
        print(result)
        print(time)
    }
    
    func TargetSuggester() -> [Double] {
        var result: Array<Double> = Array(repeating: 0, count: 10)
        for i in 0..<5 {
            result[i] = Double(arc4random_uniform(5)) * 1.0 + 3.0
        }
        for i in 0..<3 {
            result[i+5] = Double(arc4random_uniform(10)) * 0.5 + 3.0
        }
        for i in 0..<2 {
            result[i+8] = Double(arc4random_uniform(20)) * 0.25 + 3.0
        }
        return result
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let sampleCell = collectionView.dequeueReusableCell(withReuseIdentifier: "SampleCell", for: indexPath) as! TimeCountChallenge_CollectionViewCell
        sampleCell.Title.text = String(indexPath.row+1)+"回目"
        sampleCell.TargetTime.text = String(Targets[indexPath.row])
        var resultThis: String = ""
        
        if resultData[indexPath.row] != 0{
            let result_diference : Double = resultData[indexPath.row] - Targets[indexPath.row]
            if(-0.02 < result_diference && result_diference < 0.02){
                resultThis="完璧！！"
            }else if(-0.05 < result_diference && result_diference <= 0.05){
                resultThis="素晴らしい"
            }else if(-0.1 < result_diference && result_diference <= 0.1){
                resultThis="いいね"
            }else if(-0.25 < result_diference && result_diference <= 0.25){
                resultThis="OK"
            }else if(-0.5 < result_diference && result_diference <= 0.5){
                resultThis="まあまあ"
            }else if(-1 < result_diference && result_diference <= 1){
                resultThis="あとすこし"
            }else if(-2 < result_diference && result_diference <= 2){
                resultThis="うーん。。"
            }else{
                resultThis="え！？？？"
            }
            sampleCell.Result.text = resultThis
        }else{
            print("ResultData is EMPTY")
        }
        SectionNumber = indexPath.section
        print(SectionNumber)
        return sampleCell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        collectionView.dragInteractionEnabled=false
        collectionView.isScrollEnabled = false
        return CGSize(width: collectionView.frame.width / 5 - 8, height: collectionView.frame.height / 2 - 8)
    }
}
