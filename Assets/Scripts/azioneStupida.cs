using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Planner;

public class azioneStupida : Action
{
    protected bool fatto;
    private string color;

    public string Color { get => color; set => color = value; }

    public static Color ToColor(string color)
    {
        return (Color)typeof(Color).GetProperty(color.ToLowerInvariant()).GetValue(null, null);
    }
    public override void Do()
    {
        Debug.Log("COLORE:"+Color);
        GameObject.Find("Ghost_Blinky").
            transform.Find("Body").
            GetComponent<SpriteRenderer>().color = ToColor(Color);
        fatto = true;
    }

    public override bool Done()
    {
        return fatto;
    }

    public override State Prerequisite()
    {
        return State.READY;
    }

    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        
    }
}
