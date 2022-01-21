using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class azioneStupidaToc : azioneStupida
{
    
    public override void Do()
    {
        Debug.Log("TOC!");
        GameObject.Find("Ghost_Blinky").
            transform.Find("Body").
            GetComponent<SpriteRenderer>().color = UnityEngine.Color.red;
        fatto = true;
    }
}
