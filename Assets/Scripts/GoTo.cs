using Planner;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
public class GoTo : Action
{
    int DirectionX { get; set; }
    int DirectionY { get; set; }
    int PosX { get; set; }
    int PosY { get; set; }
    int MyPriority { get; set; }
    PositionToInt _pacman_pos;
    int PacmanX { 
        get
        {
            if (_pacman_pos == null)
            {
                _pacman_pos = FindObjectOfType<Pacman>().GetComponent<PositionToInt>();
            }
            return _pacman_pos.x;
        }
    }
    int PacmanY
    {
        get
        {
            if (_pacman_pos == null)
            {
                _pacman_pos = FindObjectOfType<Pacman>().GetComponent<PositionToInt>();
            }
            return _pacman_pos.y;
        }
    }
    Movement _pacman_move;
    Movement Pacman_move
    {
        get
        {
            if (_pacman_move == null)
            {
                _pacman_move = FindObjectOfType<Pacman>().GetComponent<Movement>();
            }
            return _pacman_move;
        }
    }
    int PacmanDx
    {
        get
        {
            return (int)Pacman_move.direction.x ;
        }
    }
    int PacmanDy
    {
        get
        {
            return (int)Pacman_move.direction.y;
        }
    }
    public override void Do()
    {
        Pacman_move.SetDirection(new Vector2(DirectionX, DirectionY));
    }

    public override bool Done()
    {
        return true;
    }

    public override State Prerequisite()
    {
        if(GameObject.Find("BR").GetComponent<PlannerBrainsCoordinator>().priorityExecuting == MyPriority)
        {
            return State.WAIT;
        }
        if(PacmanX == PosX && PacmanY == PosY)
        {
            return State.READY;
        }
        if(PacmanX>=PosX && PacmanDx==1 || PacmanX <= PosX && PacmanDx == -1 || PacmanY >= PosY && PacmanDy == 1 || PacmanY <= PosY && PacmanDy == -1)
        {
            return State.ABORT;
        }
        return State.WAIT;
    }
}
