﻿using UnityEngine;

public class jobjob : MonoBehaviour
{
    [SerializeField] Transform rigid;
    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        
    }

    public void move()
    {
       rigid.position = new Vector3(0, 1, 0);
    }
}
