using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Controller : MonoBehaviour
{
    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        // left arrw ( <- )
        if (Input.GetKey(KeyCode.LeftArrow)) {
            // 対象となるオブジェクトのポジションが左へずれる？
            // transform forwardが謎
            transform.position -= transform.forward * 0.2f;
            // 対象となるオブジェクトのポジションが右へずれる？
            // transform forwardが謎
        }else if (Input.GetKey(KeyCode.RightArrow)) {
            transform.position += transform.forward * 0.2f;
        }
    }
}
