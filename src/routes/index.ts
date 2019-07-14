import {Request, Response, NextFunction} from "express";

const express = require('express');
const router = express.Router();

const config = require('../../config');

router.get('/', (req: Request, res: Response, next: NextFunction) => {
  res.render('index', { title: config.app.title });
});

export = router;
