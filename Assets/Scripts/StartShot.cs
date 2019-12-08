using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class StartShot : MonoBehaviour
{
    // Start is called before the first frame update
    void Start()
    {
        // このスクリプトがアタッチされているオブジェクトのTransformの回転角情報をx=0, y=ランダムで(30~120), z=0にする．
        transform.eulerAngles = new Vector3(0, Random.Range(30, -120), 0);
        // このスクリプトがアタッチされているオブジェクトにアタッチされている"RigidBody"コンポーネントのAddForce関数を呼ぶ．
        gameObject.GetComponent<Rigidbody>().AddForce(transform.forward * 500);
    }

    // Update is called once per frame
    void Update()
    {
        
    }
}
