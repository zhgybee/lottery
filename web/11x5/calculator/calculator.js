(function () {
    "use strict";
    var e = window.jQuery,
        t = {
            version: "0.0.1",
            time_stamp: +(new Date),
            system: {},
            number: {},
            date: {},
            string: {},
            cookie: {},
            pages: {}
        };
    t.system.is_mobile = function () {
        var e = window.navigator.userAgent,
            t = e.length,
            n = e.replace(/iphone|ipad mini|ipad|ipod|android|Series60|BlackBerry|Windows Phone/gi, "").length;
        return n !== t
    }(), t.number.format = function (e, n, r) {
        var i;
        n = typeof (n * 1) != "number" || isNaN(n * 1) ? 2 : Math.abs(n), i = Math.pow(10, n), e *= 1;
        var s = 9.9999e-11;
        switch (r) {
        case 1:
            e = Math.ceil(e * i) / i;
            break;
        case -1:
            e = Math.floor(e * i + s) / i;
            break;
        case 465:
            var o = Math.floor(e * i + s) % 10 % 2,
                u = Math.floor(e * i * 10 + s) % 10 == 5,
                a = u && !o ? 1 / i : 0;
            e = t.number.format(e, n) - a;
            break;
        default:
            e = (e * i + s) / i
        }
        return (e.toFixed(n) + "").replace(/^\./g, "0.").replace(/\.$/, "")
    }, t.number.currency = function (e, n, r) {
        var i;
        return typeof n != "undefined" && (e = t.number.format(e, n, r)), i = (e + "").split("."), i[0] = i[0].replace(/(\d)(?=(\d{3})+$)/g, "$1,"), (i[0] + (i.length == 2 ? "." + i[1] : "")).replace(/^\./g, "0.")
    }, t.number.percent = function (e, n, r, i) {
        return t.number.format(e * 1 * (n || 100), r, i)
    }, t.number.combo = function (e, t) {
        var n, r;
        e / 2 < t && (t = e - t);
        if (e < t || t < 0) return 0;
        if (e >= 0 && t === 0) return 1;
        n = 1, r = e;
        for (var i = 1; i <= t; i++) n *= i, i < t && (r *= e - i);
        return r / n
    }, t.number.each_combo = function (e, t) {
        var n = [];
        return function r(e, t, i) {
            if (i === 0) return n.push(e);
            for (var s = 0, o = t.length; s <= o - i; s++) r(e.concat(t[s]), t.slice(s + 1), i - 1)
        }([], e, t), n
    }, t.number.each_array_combo = function (e) {
        var t = 0,
            n = e.length,
            r = [],
            i, s = [];
        return s.push(e),
            function o(e) {
                var s = [];
                for (var u = 0, a = e.length; u < a; u++)
                    for (var f = 0, l = e[u][t].length; f < l; f++) i = [].concat(e[u]), i.splice(t, 1, e[u][t][f]), s.push(i);
                t++;
                if (!(t < n)) {
                    r = s;
                    return
                }
                o(s)
            }(s), r
    }, t.number.permutation = function (e, t) {
        var n = 1;
        if (e < t || t < 0) return 0;
        for (var r = 0; r < t; r++) n *= e - r;
        return n
    }, t.number.each_permutation = function (e, t) {
        var n = [];
        return function r(e, t, i) {
            if (i === 0) return n.push(e);
            for (var s = 0, o = t.length; s < o; s++) r(e.concat(t[s]), t.slice(0, s).concat(t.slice(s + 1)), i - 1)
        }([], e, t), n
    }, t.number.random = function (n) {
        var r = {
            min: 0,
            max: 9,
            share: [],
            shahao: [],
            size: 1
        };
        e.extend(r, n), r.count = r.count || 1;
        var i = function (t) {
                var n, r, i = 0,
                    s, o, u = "0000000000000000";
                s = (t.max + "").length, n = (t.share || []).toString(), n = n === "" ? [] : n.split(/[,\-_=+\|]/), o = n.length;
                if (o > 0 && t.max > 9)
                    for (var a = 0; a < o; a++) n[a].length < s && (n[a] = u.substr(0, s - n[a].length) + n[a]);
                while (i < t.size) {
                    r = Math.floor(Math.random() * (t.max - t.min + 1)) + t.min + "", r = u.substr(0, s - r.length) + r;
                    if (t.repeat || !t.repeat && e.inArray(r, n) == -1 && e.inArray(r, t.shahao || []) == -1) n.push(r), i++
                }
                return !t.sort || n.sort(), typeof t.split_str != "undefined" ? n.join(t.split_str) : n
            },
            s = [],
            o = t.number.combo(r.max - r.min + 1 - r.share.length - r.shahao.length, r.size);
        o < r.count && (r.repeat_team = 1);
        for (var u = 0; u < r.count; u++) {
            var a = i(r);
            if (!r.repeat_team) {
                var f = s.length,
                    l = 0;
                for (var c = 0; c < f; c++)
                    if (s[c].toString() == a.toString()) {
                        l = 1;
                        break
                    }
                l ? u-- : s.push(a)
            } else s.push(a)
        }
        return s
    }, t.number.to_number = function (e) {
        return e -= 0, e = isNaN(e) ? 0 : e, e
    }, t.number.pass_key = function (t) {
        return e.inArray(t.keyCode, [8, 16, 17, 37, 38, 39, 40, 46, 67]) >= 0
    }, t.number.is_seq = function (e) {
        var t = [].concat(e),
            n, r;
        t.sort(function (e, t) {
            return e - t
        });
        for (n = 0, r = t.length; n < r - 1; n++)
            if (t[n + 1] - t[n] == 1) return !0;
        return e.length < 2 ? !1 : !1
    }, t.date.format = function (e, n) {
        var r, i, s, o, u, a, f;
        return e = typeof e == "object" ? e : new Date(e * 1), n = n || "YYYY-MM-DD hh:mm:ss", r = e.getFullYear(), s = e.getMonth() + 1, o = e.getDate(), u = e.getHours(), a = e.getMinutes(), f = e.getSeconds(), i = (r + "").replace(/^\d\d/g, ""), s = s < 10 ? "0" + s : s, o = o < 10 ? "0" + o : o, u = u < 10 ? "0" + u : u, a = a < 10 ? "0" + a : a, f = f < 10 ? "0" + f : f, t.string.mul_replace(n, [
            [/YYYY/, r],
            [/YY/, i],
            [/MM/, s],
            [/DD/, o],
            [/hh/, u],
            [/mm/, a],
            [/ss/, f]
        ])
    }, t.date.to_date = function (t) {
        var n, r, i;
        return n = e.trim(t).split(" "), r = n[0].split(/[\-\/]/), i = n[1] ? n[1].split(":") : [0, 0, 0], new Date(r[0], r[1] - 1, r[2], i[0], i[1], i[2])
    }, t.date.get_date = function (e) {
        var t = /^\s*(\d{4})-?(\d\d)-?(\d\d)\s*$/,
            n = new Date(NaN),
            r, i = t.exec(e);
        return i && (r = +i[2], n.setFullYear(i[1], r - 1, i[3]), r != n.getMonth() + 1 && n.setTime(NaN)), n
    }, t.date.get_week_text = function (e) {
        e = e.replace(/[\-\/]/g, "");
        var t = new Date(e.substr(0, 4) * 1, e.substr(4, 2) * 1 - 1, e.substr(6, 2) * 1),
            n = t.getDay(),
            r = ["\u5468\u65e5", "\u5468\u4e00", "\u5468\u4e8c", "\u5468\u4e09", "\u5468\u56db", "\u5468\u4e94", "\u5468\u516d"];
        return r[n]
    }, t.string.len = function (e) {
        return e.replace(/[^\x00-\xff]/g, "--").length
    }, t.string.cut = function (e, n, r) {
        return r = r || "", t.string.len(e) <= n - r.length ? e : (n -= r.length, e.substr(0, n).replace(/([^\x00-\xff])/g, "$1 ").substr(0, n).replace(/[^\x00-\xff]$/, "").replace(/([^\x00-\xff]) /g, "$1") + r)
    }, t.string.get_url_param = function (e, t) {
        var n, r, i;
        return t = (t || window.location.href).toLowerCase().split("#"), e.indexOf("#") != -1 ? i = t.length < 2 ? "" : t[1] : i = t[0], n = i.match(new RegExp("(|[?&#])" + e.replace("#", "") + "=([^#&?]*)(\\s||$)", "gi")), n ? decodeURIComponent(n[0].split("=")[1]) : ""
    }, t.string.mul_replace = function (e, t) {
        for (var n = 0, r = t.length; n < r; n++) e = e.replace(t[n][0], t[n][1]);
        return e
    }, t.string.dbc_to_sbc = function (e) {
        return t.string.mul_replace(e, [
            [/[\uff01-\uff5e]/g,
                function (e) {
                    return String.fromCharCode(e.charCodeAt(0) - 65248)
                }
            ],
            [/\u3000/g, " "],
            [/\u3002/g, "."]
        ])
    }, t.cookie.get = function (e, t) {
        var n = document.cookie.match(new RegExp("(^| )" + e + "=([^;])*", "gi")),
            r = n ? n[0].split(e + "=")[1] : "";
        return t ? r : decodeURIComponent(r)
    }, t.cookie.set = t.cookie.del = function (e) {
        var t = [];
        t.push(e.name + "="), e.value && t.push(e.encode ? e.value : encodeURIComponent(e.value));
        if (e.expires) {
            var n = new Date;
            n.setHours(0), n.setMinutes(0), n.setSeconds(0), n.setTime(n.getTime() + e.expires * 864e5), t.push(";expires=" + n.toGMTString())
        }
        e.domain && t.push(";domain=" + e.domain), t.push(";path=" + (e.path || "/")), e.secure && t.push(";secure"), document.cookie = t.join("")
    }, window.Q = window.qh360cp = t
})();


(function () {
    "use strict";
    var e = window.jQuery,
        t = window.qh360cp || {},
        n = window._;
	console.log(t);
    t.pages = t.pages || {}, t.pages.lottery = e("#doc3").attr("data") || 258001, t.pages.index = 0, t.pages.param = {
        qi_max: "10",
        zhu: "1",
        bonus: "11",
        init_time: "1",
        win_percent: "50",
        mode: "1",
        pre_qi: "5",
        pre_win_percent: "50",
        next_win_percent: "30",
        solid_win: "100",
        pre_qi2: "5",
        pre_win_solid: "100",
        next_win_solid: "100",
        fin_input: "0"
    }, t.pages.paramMax = {
        qi_max: {
            sscjx: 84,
            ssccq: 120,
            sywsd: 78,
            syxwjx: 78,
            syxwgd: 84,
            syxwsh: 90,
            syxwln: 83,
            syxwhlj: 79,
            syxwxj: 97,
            syxwcq: 85,
            k3jl: 79,
            k3nm: 73,
            k3js: 82,
            k3hb: 78,
            k3gx: 78
        },
        init_time: {
            sscjx: 2e3,
            ssccq: 2e3,
            sywsd: 2e3,
            syxwjx: 2e3,
            syxwgd: 2e3,
            syxwsh: 2e3,
            syxwln: 2e3,
            syxwhlj: 2e3,
            syxwxj: 2e3,
            syxwcq: 2e3,
            k3jl: 2e3,
            k3nm: 2e3,
            k3js: 2e3,
            k3hb: 2e3,
            k3gx: 2e3
        },
        zhu: {
            sscjx: 999,
            ssccq: 999,
            sywsd: 999,
            syxwjx: 999,
            syxwgd: 999,
            syxwsh: 999,
            syxwln: 999,
            syxwhlj: 999,
            syxwxj: 999,
            syxwcq: 999,
            k3jl: 999,
            k3nm: 999,
            k3js: 999,
            k3hb: 999,
            k3gx: 999
        }
    }, t.pages.init = function () {
        switch (t.pages.lottery) {
        case "258001":
            t.pages.index = 0, e("input[name=ssc]").eq(0).prop("checked", !0), e(".caizselect .input-small").hide().eq(0).show(), e("#bonus").val(11);
            break;
        case "255401":
            t.pages.index = 0, e("input[name=ssc]").eq(1).prop("checked", !0), e(".caizselect .input-small").hide().eq(1).show(), e("#bonus").val(10), t.pages.param.bonus = 10;
            break;
        case "168009":
            t.pages.index = 1, e("input[name=xw]").eq(0).prop("checked", !0), e(".caizselect .input-small").hide().eq(2).show(), e("#bonus").val(6), t.pages.param.bonus = 6;
            break;
        case "166406":
            t.pages.index = 1, e("input[name=xw]").eq(1).prop("checked", !0), e(".caizselect .input-small").hide().eq(2).show(), e("#bonus").val(6), t.pages.param.bonus = 6;
            break;
        case "166907":
            t.pages.index = 1, e("input[name=xw]").eq(5).prop("checked", !0), e(".caizselect .input-small").hide().eq(2).show(), e("#bonus").val(6), t.pages.param.bonus = 6;
            break;
        case "165707":
            t.pages.index = 1, e("input[name=xw]").eq(2).prop("checked", !0), e(".caizselect .input-small").hide().eq(2).show(), e("#bonus").val(6), t.pages.param.bonus = 6;
            break;
        case "166507":
            t.pages.index = 1, e("input[name=xw]").eq(3).prop("checked", !0), e(".caizselect .input-small").hide().eq(2).show(), e("#bonus").val(6), t.pages.param.bonus = 6;
            break;
        case "165207":
            t.pages.index = 1, e("input[name=xw]").eq(4).prop("checked", !0), e(".caizselect .input-small").hide().eq(2).show(), e("#bonus").val(6), t.pages.param.bonus = 6;
            break;
        case "167607":
            t.pages.index = 1, e("input[name=xw]").eq(6).prop("checked", !0), e(".caizselect .input-small").hide().eq(2).show(), e("#bonus").val(6), t.pages.param.bonus = 6;
            break;
        case "165407":
            t.pages.index = 1, e("input[name=xw]").eq(7).prop("checked", !0), e(".caizselect .input-small").hide().eq(2).show(), e("#bonus").val(6), t.pages.param.bonus = 6;
            break;
        case "258203":
            t.pages.index = 2, e("input[name=k3]").eq(0).prop("checked", !0), e(".caizselect .input-small").hide().eq(3).show(), e("#bonus").val(8), t.pages.param.bonus = 8;
            break;
        case "257503":
            t.pages.index = 2, e("input[name=k3]").eq(1).prop("checked", !0), e(".caizselect .input-small").hide().eq(3).show(), e("#bonus").val(8), t.pages.param.bonus = 8;
            break;
        case "255903":
            t.pages.index = 2, e("input[name=k3]").eq(2).prop("checked", !0), e(".caizselect .input-small").hide().eq(3).show(), e("#bonus").val(8), t.pages.param.bonus = 8;
            break;
        case "255803":
            t.pages.index = 2, e("input[name=k3]").eq(3).prop("checked", !0), e(".caizselect .input-small").hide().eq(3).show(), e("#bonus").val(8), t.pages.param.bonus = 8;
            break;
        case "257703":
            t.pages.index = 2, e("input[name=k3]").eq(4).prop("checked", !0), e(".caizselect .input-small").hide().eq(3).show(), e("#bonus").val(8), t.pages.param.bonus = 8
        }
        e(".bttips,.wbttips").on("mouseover", function () {
            var n = e(this).attr("tips");
            t.lightbox.tips_tmp = t.lightbox.tips({
                offset_box: e(this),
                content: n,
                width: 230,
                left: -255
            })
        }).on("mouseout", function () {
            t.lightbox.tips_tmp.close()
        }), e(window).scroll(function () {
            t.pages.tableFloat()
        }), e(window).resize(function () {
            t.pages.tableFloat()
        }), t.pages.tableFloat = function () {
            var n, r, i, s, o;
            o = e(".sc-data_head").eq(0).parent("table"), o.hide(), n = e(window).scrollTop();
            var u = o.next("table");
            i = u.offset().top, s = u.height(), r = n - i + 32, o.css("top", r), clearTimeout(t.pages.stt), t.pages.stt = setTimeout(function () {
                r > 0 && r - s + 30 < 0 ? o.show().animate({
                    top: r
                }, 100) : o.hide()
            }, 400)
        }, e(".caizselect .input-small").on("change", function () {
            var n = e(this).val();
            e("#bonus").val(n), t.pages.param.bonus = n
        }), e(".mod-select input[type=radio]").on("click", function () {
            e(".prew .input-small").hide(), e("." + e(this).val()).show().change(), e("#zhu").val("1"), e("#qi_max").val("10"), e("#init_time").val("1"), e("input[type=text]").blur(), e("#toshow").html('<tr ><td colspan="7" style="padding-top:20px; text-align:center">暂未生成投注方案！</td></tr>')
        }), e(".btn-large3").on("click", function () {
            var n = "",
                r = t.pages.wholeMode(t.pages.param) || {},
                i = r.times.length,
                s = [],
                o = 1;
            for (; o < i; o++) s.push("<tr><td>" + o + "</td><td>" + r.times[o] + "倍</td><td>" + r.cur_input[o] + "元</td><td>" + r.total[o] + "元</td><td>中" + r.cur_win[o] + '元</td><td><em>' + r.win[o] + '</em>元</td><td>' + t.number.percent(r.win_percent[o], 100, 0) + "%</td></tr>");
            var u = e("#toshow");
            u.html(s.join("")), e("tr:odd", u).addClass("even"), e("tr", u).hover(function () {
                e(this).addClass("cur")
            }, function () {
                e(this).removeClass("cur")
            })
        }), e(".set-cont-box input[type=radio]").on("click", function () {
            var n = e(this);
            n.parents("li").siblings("li").addClass("dissel").find("input[type=text]").prop("disabled", !0), n.prop("checked") && (t.pages.param.mode = n.attr("mode"), n.parents("li").removeClass("dissel").find("input[type=text]").prop("disabled", !1))
        }), e("input[type=text]").on("blur", function () {
            var n = e(this),
                r, i = n.val();
            i = i.replace(/^[0|\D]*([1-9]\d{0,})*.*?$/, "$1"), i = i === "" ? n.attr("id") == "fin_input" ? "0" : t.pages.param[n.attr("id")] : i;
            var s = e(".caiztab:visible input:checked");
            r = t.pages.paramMax[n.attr("id")] ? t.pages.paramMax[n.attr("id")][s.val()] : !1, i = r ? r < i ? r : i : i, n.val(i), i !== "" && t.pages.param[n.attr("id")] && (t.pages.param[n.attr("id")] = n.val())
        })
    }, t.pages.wholeMode = function (e) {
        var n = {
                times: [e.init_time * 1],
                cur_input: [0],
                total: [e.fin_input * 1],
                cur_win: [0],
                win: [0],
                win_percent: [0]
            },
            r = e.init_time,
            i = 0,
            s = 0,
            o = 0,
            u = e.win_percent * 1 / 100,
            a = !0,
            f = e.pre_win_percent * 1 / 100,
            l = e.next_win_percent * 1 / 100,
            c = e.pre_qi * 1,
            h = e.pre_qi2 * 1,
            p = e.pre_win_solid * 1,
            d = e.next_win_solid * 1,
            v = e.mode,
            m = e.qi_max * 1;
        for (var g = 1; g <= m; g++) {
            if (!a) break;
            for (var y = r; y < 99999; y++) {
                i = e.zhu * 1 * y * 2, s = e.bonus * 1 * y;
                var b = s - i - n.total[g - 1];
                o = b / (i + n.total[g - 1]);
                var w;
                switch (e.mode) {
                case "1":
                    w = o >= u;
                    break;
                case "2":
                    w = o >= (g <= c ? f : l);
                    break;
                case "3":
                    w = b >= e.solid_win;
                    break;
                case "4":
                    w = b >= (g <= h ? p : d);
                    break;
                default:
                    return !1
                }
                if (w) {
                    r = y, n.times.push(y), n.cur_input.push(i), n.total.push(i + n.total[g - 1]), n.cur_win.push(s), n.win.push(s - n.total[g]), n.win_percent.push(o);
                    break
                }
                if (y >= 99998) {
                    a = !1, g < e.qi_max && alert("该方案第" + g + "期后,投注倍数过大,不适合投注,请重新设置!");
                    break
                }
            }
        }
        return n
    }, e(function () {
        t.pages.init()
    })
})();