// Stimulus アプリケーションを作成
import { Application } from "@hotwired/stimulus";
import { definitionsFromContext } from "@hotwired/stimulus-webpack-helpers";

const application = Application.start();

// controllers フォルダ内にあるすべてのコントローラーを自動登録
const context = require.context("./", true, /\.js$/);
application.load(definitionsFromContext(context));
