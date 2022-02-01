using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Planner;
using System.Diagnostics;
using Debug = UnityEngine.Debug;

public class azioneStupida : Action
{
    protected bool fatto;
    private string color;
    private Stopwatch watch;

    public string Color { get => color; set => color = value; }

    public static Color ToColor(string color)
    {
        return (Color)typeof(Color).GetProperty(color.ToLowerInvariant()).GetValue(null, null);
    }
    public override void Do()
    {
        watch = new Stopwatch();
        //Debug.Log("COLORE:"+Color);
        /*GameObject.Find("Ghost_Blinky").
            transform.Find("Body").
            GetComponent<SpriteRenderer>().color = ToColor(Color);*/
        Debug.Log("cia");
        watch.Start();
    }

    public override bool Done()
    {
        /*if (watch.ElapsedMilliseconds > 10)
        {
            watch.Stop();
        }*/
        return true;
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
